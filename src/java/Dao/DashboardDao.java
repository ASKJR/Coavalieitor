/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.CorrecaoFinal;
import Beans.GraficoFasesAvaliacao;
import Beans.ItemListaAvaliacoesMes;
import Beans.ItemListaCorrecoesMes;
import Beans.ItemListaCorretor;
import Beans.ItemListaMediaMes;
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
    +"(SELECT COUNT(*) AS naoIniciadas FROM avaliacao aval JOIN turma tur ON (aval.turma_id = tur.id) WHERE submissao_inicial > NOW() AND tur.professor_usuario_id =?) AS NaoIniciadas, "
    +"(SELECT COUNT(*) AS emSubmissao FROM avaliacao aval JOIN turma tur ON (aval.turma_id = tur.id) WHERE NOW() >= submissao_inicial AND NOW() < submissao_final AND tur.professor_usuario_id =?) AS emSubmissao, "
    +"(SELECT COUNT(*) AS emCorrecao FROM avaliacao aval JOIN turma tur ON (aval.turma_id = tur.id) WHERE NOW() >= correcao_inicial AND NOW() < correcao_final AND tur.professor_usuario_id =?) AS emCorrecao, "
    +"(SELECT COUNT(*) AS finalizadas FROM avaliacao aval JOIN turma tur ON (aval.turma_id = tur.id) WHERE NOW() > correcao_final AND tur.professor_usuario_id =?) AS finalizadas; ";
            
    private final static String TOP_CORRETORES = 
    "SELECT  usAluno.nome, count(*) AS qtdCorrecoes FROM coavalieitor_db.correcao cor " 
    +"JOIN solucao sol on sol.id = cor.solucao_id " 
    +"JOIN avaliacao aval on aval.id = sol.avaliacao_id " 
    +"JOIN turma tur ON aval.turma_id = tur.id " 
    +"JOIN usuario usAluno ON (usAluno.id = cor.aluno_usuario_id) " 
    +"WHERE tur.professor_usuario_id = ? " 
    +"GROUP BY usAluno.id LIMIT 5";
    
    private final static String LISTA_MENORES_NOTAS =     
    "SELECT usAluno.nome AS nome, cf.nota_final AS nota " 
    +"FROM correcao_final cf " 
    +"JOIN usuario usAluno ON (cf.aluno_usuario_id = usAluno.id) " 
    +"JOIN avaliacao aval ON (aval.id = cf.avaliacao_id) " 
    +"JOIN turma tur ON aval.turma_id = tur.id "             
    +"WHERE ((SELECT id FROM coavalieitor_db.avaliacao ORDER BY id DESC LIMIT 1) = cf.avaliacao_id AND tur.professor_usuario_id = ?) " 
    +"ORDER BY nota LIMIT 10" ;
    
    private final static String LISTA_AVALIACOES_MES =         
    "SELECT  MONTH(aval.submissao_final) AS mes, YEAR(aval.submissao_final) as ano,  COUNT(*) as qtdAvaliacoes "
    +"FROM      coavalieitor_db.avaliacao aval "    
    +"JOIN turma tur on (tur.id = aval.turma_id) "            
    +"WHERE tur.professor_usuario_id = ? "
    +"GROUP BY YEAR(aval.submissao_final), MONTH(aval.submissao_final) "
    +"ORDER BY YEAR(aval.submissao_final), MONTH(aval.submissao_final) "
    +"LIMIT 12";
    
    private final static String LISTA_CORRECOES_MES =
    "SELECT  MONTH(sol.solucao_data) AS mes, YEAR(sol.solucao_data) as ano,  COUNT(*) as qtdCorrecoes "
    +"FROM coavalieitor_db.avaliacao aval "
    +"JOIN solucao sol ON (sol.avaliacao_id = aval.id) "
    +"JOIN correcao cor ON (cor.solucao_id = sol.id) "
    +"JOIN turma tur on (tur.id = aval.turma_id) "            
    +"WHERE tur.professor_usuario_id = ? "            
    +"GROUP BY YEAR(cor.correcao_data), MONTH(cor.correcao_data) "
    +"ORDER BY YEAR(cor.correcao_data), MONTH(cor.correcao_data) "
    +"LIMIT 12";
    
    private final static String LISTA_MEDIA_MES =
    "SELECT AVG(cf.nota_final), aval.nota_maxima AS nota, (AVG(cf.nota_final) / aval.nota_maxima) AS media, "
    +"MONTH(sol.solucao_data) AS mes, YEAR(sol.solucao_data) as ano, COUNT(*) as qtdCorrecoes, tur.nome AS turma "
    +"FROM coavalieitor_db.avaliacao aval "
    +"JOIN solucao sol ON (sol.avaliacao_id = aval.id) "
    +"JOIN correcao cor ON (cor.solucao_id = sol.id) "
    +"JOIN correcao_final cf ON (cf.avaliacao_id = aval.id) "
    +"JOIN turma tur ON (tur.id = aval.turma_id) "
    +"JOIN usuario us ON (us.id = tur.professor_usuario_id) "
    +"GROUP BY  MONTH(sol.solucao_data), tur.nome "
    +"ORDER BY tur.nome "
    +"LIMIT 12 ";
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public DashboardDao(){
    }
     
    public GraficoFasesAvaliacao getDadosGraficoFasesAvaliacao(int idProfessor) {
        try {
            GraficoFasesAvaliacao grafFasesAval = new GraficoFasesAvaliacao();
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(GRAFICO_FASES_AVALIACAO);
            stmt.setInt(1,idProfessor);
            stmt.setInt(2,idProfessor);
            stmt.setInt(3,idProfessor);            
            stmt.setInt(4,idProfessor);                      
            rs = stmt.executeQuery();
            while (rs.next()) {
                grafFasesAval.setNaoIniciadas(rs.getInt("naoIniciadas"));
                grafFasesAval.setEmSubmissão(rs.getInt("emSubmissao"));
                grafFasesAval.setEmCorrecao(rs.getInt("emCorrecao"));
                grafFasesAval.setFinalizadas(rs.getInt("finalizadas"));
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
    
    public ArrayList<ItemListaCorretor> obterListaCorretores (int idProfessor) {
        ArrayList<ItemListaCorretor> listaRetorno = new ArrayList<ItemListaCorretor>();
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(TOP_CORRETORES);
            stmt.setInt(1, idProfessor);
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
    
    public ArrayList<ItemListaMenoresNotas> obterListaMenoresNotas (int idProfessor) {
        ArrayList<ItemListaMenoresNotas> listaRetorno = new ArrayList<ItemListaMenoresNotas>();
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(LISTA_MENORES_NOTAS);
            stmt.setInt(1, idProfessor);            
            rs = stmt.executeQuery();
            while (rs.next()) {
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

    public ArrayList<ItemListaAvaliacoesMes> obterListaAvaliacoesMes (int idProfessor) {
        ArrayList<ItemListaAvaliacoesMes> listaRetorno = new ArrayList<ItemListaAvaliacoesMes>();
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(LISTA_AVALIACOES_MES);
            stmt.setInt(1,idProfessor);                        
            rs = stmt.executeQuery();
            while (rs.next()) {
                ItemListaAvaliacoesMes item = new ItemListaAvaliacoesMes();
                item.setMes(rs.getString("mes"));
                item.setAno(rs.getString("ano"));                
                item.setQtdAvaliacoes(rs.getInt("qtdAvaliacoes"));
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
    
    public ArrayList<ItemListaCorrecoesMes> obterListaCorrecoesMes (int idProfessor) {
        ArrayList<ItemListaCorrecoesMes> listaRetorno = new ArrayList<ItemListaCorrecoesMes>();
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(LISTA_CORRECOES_MES);
            stmt.setInt(1,idProfessor);                        
            rs = stmt.executeQuery();
            while (rs.next()) {
                ItemListaCorrecoesMes item = new ItemListaCorrecoesMes();
                item.setMes(rs.getString("mes"));
                item.setAno(rs.getString("ano"));                
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
    
    public ArrayList<ItemListaMediaMes> obterListaMediaMes () {
        ArrayList<ItemListaMediaMes> listaRetorno = new ArrayList<ItemListaMediaMes>();
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(LISTA_MEDIA_MES);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ItemListaMediaMes item = new ItemListaMediaMes();
                item.setMes(rs.getString("mes"));
                item.setAno(rs.getString("ano"));                
                item.setMedia(rs.getString("media"));                
                item.setTurma(rs.getString("turma"));
                listaRetorno.add(item);
                //System.out.println("teste"+item.getMedia()+","+item.getTurma());
            }
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDao.class.getName()).log(Level.SEVERE, null, ex);        
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
        //Criar uma lista de listas / Turmas / Mês
        return listaRetorno;
    }        
}
