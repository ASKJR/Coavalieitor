/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Correcao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author Kato
 */
public class CorrecaoDao {
    
    /*SQL*/
    private final static String INSERT = 
    "INSERT INTO correcao "
   +"(comentario,nota,solucao_id,aluno_usuario_id,correcao_data) "
   +"VALUES (?,?,?,?,?)";         
   
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public CorrecaoDao(){
    }
    
    public void insert(Correcao correcao) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,correcao.getComentario());
            stmt.setDouble(2,correcao.getNota());
            stmt.setInt(3,correcao.getSolucao().getId());
            stmt.setInt(4,correcao.getAluno().getId());
            stmt.setTimestamp(5,new Timestamp(correcao.getCorrecao_data().getTime()));
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }       
}
