/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.CorrecaoFinal;
import Beans.GraficoFasesAvaliacao;
import Beans.ItemListaCorretor;
import Beans.ItemListaMenoresNotas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Welyngton
 */
public class DashboardDao {
    
    /*SQL*/
    private final static String AVAL_NAO_INICIADAS = 
    "SELECT count(*) as naoIniciadas FROM avaliacao Where submissao_inicial > now()";

    private final static String AVAL_FINALIZADAS = 
    "SELECT count(*) as finalizadas FROM avaliacao Where submissao_final < now()";    
    
    private final static String AVAL_EM_ANDAMENTO = 
    "SELECT count(*) as emAndamento FROM avaliacao Where submissao_inicial < now() submissao_final > now()";
 
    private final static String GRAFICO_FASES_AVALIACAO = 
    "SELECT "
    +" (SELECT COUNT(*) AS naoIniciadas FROM avaliacao WHERE submissao_inicial > NOW()) AS NaoIniciadas,"
    +" (SELECT COUNT(*) AS finalizadas FROM avaliacao WHERE submissao_final < NOW()) AS finalizadas,"
    +" (SELECT COUNT(*) AS emAndamento FROM avaliacao WHERE submissao_inicial < NOW() AND submissao_final > NOW()) AS emAndamento";
    
    private final static String TOP_CORRETORES = 
    "SELECT  usAluno.nome, count(*) AS qtdCorrecoes FROM coavalieitor_db.correcao cor "
    +"JOIN usuario usAluno ON (usAluno.id = cor.aluno_usuario_id) "
    +"GROUP BY usAluno.id LIMIT 5";
    
    private final static String LISTA_MENORES_NOTAS =     
    "SELECT usAluno.nome AS nome, cf.nota_final AS nota " 
    +"FROM correcao_final cf " 
    +"JOIN usuario usAluno ON (cf.aluno_usuario_id = usAluno.id) " 
    +"JOIN avaliacao aval ON (aval.id = cf.avaliacao_id) " 
    +"WHERE ((SELECT id FROM coavalieitor_db.avaliacao ORDER BY id DESC LIMIT 1) = cf.avaliacao_id) " 
    +"ORDER BY nota";
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public DashboardDao(){
    }
     
    public GraficoFasesAvaliacao getDadosGraficoFasesAvaliacao() {
        try {
            GraficoFasesAvaliacao grafFasesAval = new GraficoFasesAvaliacao();
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(GRAFICO_FASES_AVALIACAO);
            rs = stmt.executeQuery();
            while (rs.next()) {
                grafFasesAval.setNaoIniciadas(rs.getInt("naoIniciadas"));
                grafFasesAval.setNaoIniciadas(rs.getInt("emAndamento"));
                grafFasesAval.setNaoIniciadas(rs.getInt("finalizadas"));
            }
            return grafFasesAval;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    
    public ArrayList<ItemListaCorretor> obterListaCorretores () {
        ArrayList<ItemListaCorretor> listaRetorno = new ArrayList<ItemListaCorretor>();
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(TOP_CORRETORES);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ItemListaCorretor item = new ItemListaCorretor();
                item.setNome(rs.getString("nome"));
                item.setQtdCorrecoes(rs.getInt("qtdCorrecoes"));
                listaRetorno.add(item);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDao.class.getName()).log(Level.SEVERE, null, ex);        
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
        return listaRetorno;
    }
    
    public ArrayList<ItemListaMenoresNotas> obterListaMenoresNotas () {
        ArrayList<ItemListaMenoresNotas> listaRetorno = new ArrayList<ItemListaMenoresNotas>();
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(LISTA_MENORES_NOTAS);
            rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println("alo2");
                ItemListaMenoresNotas item = new ItemListaMenoresNotas();
                item.setNome(rs.getString("nome"));
                item.setNota(rs.getInt("nota"));
                listaRetorno.add(item);
                System.out.println(item.getNome());
            }
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDao.class.getName()).log(Level.SEVERE, null, ex);        
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
        return listaRetorno;
    }         
}
