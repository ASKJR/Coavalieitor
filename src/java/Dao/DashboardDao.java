/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.CorrecaoFinal;
import Beans.GraficoFasesAvaliacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    
   }
