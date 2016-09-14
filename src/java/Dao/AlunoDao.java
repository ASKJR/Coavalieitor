/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Aluno;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kato
 */
public class AlunoDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO aluno (usuario_id) VALUES (?)";
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public void insert(Aluno aluno) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setInt(1,aluno.getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
}
