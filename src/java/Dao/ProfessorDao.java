/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Professor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Kato
 */
public class ProfessorDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO professor (nome) VALUES (?)";
    
    /*DB variables*/
    private Connection con         = null;
    private PreparedStatement stmt = null;

    public ProfessorDao() {
    }
    public void insert(Professor professor) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,professor.getNome());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
}
