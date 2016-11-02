/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.CorrecaoFinal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kato
 */
public class CorrecaoFinalDao {
    
    /*SQL*/
    private final static String INSERT = 
    "INSERT INTO correcao_final "
   +"(feedback,nota_final,avaliacao_id,aluno_usuario_id,correcao_final_data) "
   +"VALUES (?,?,?,?,NOW()) ";
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public CorrecaoFinalDao(){
    }
    
    public void insert(CorrecaoFinal correcaoFinal) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,correcaoFinal.getFeedback());
            stmt.setDouble(2,correcaoFinal.getNota_final());
            stmt.setInt(3,correcaoFinal.getAvaliacao().getId());
            stmt.setInt(4,correcaoFinal.getAluno().getUser().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
}
