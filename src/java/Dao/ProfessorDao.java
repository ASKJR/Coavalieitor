/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Professor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kato
 */
public class ProfessorDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO professor (usuario_id) VALUES (?)";
    private final static String DELETE = "DELETE FROM professor WHERE id_prof=?";
    private final static String UPDATE = "UPDATE professor SET nome=? WHERE id_prof=?";
    private final static String SELECT = "SELECT * FROM professor";
    private final static String SELECT_ID = "SELECT * FROM professor WHERE usuario_id=?";
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;

    public ProfessorDao() {
    }
    public void insert(Professor professor) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setInt(1,professor.getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void update(Professor professor){
        try{
                con  = new ConnectionFactory().getConnection();
                stmt = con.prepareStatement(UPDATE);	
               // stmt.setString(1,professor.getNome());
                stmt.setLong(2,professor.getId());
                stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public Professor getProfessorById(int id){
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_ID);
            stmt.setLong(1,id);
            rs = stmt.executeQuery();

            if(rs.next()) {
                Professor professor = new Professor();
                professor.setId(rs.getInt("usuario_id"));
                return professor;

            }
            else{
                return null;
            }
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    public List<Professor> getAllProfessores() {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT);
            List<Professor> professores = new ArrayList<>();

            rs = stmt.executeQuery();

            while (rs.next()) {
                Professor professor = new Professor();
                professor.setId(rs.getInt("id_prof"));
                //professor.setNome(rs.getString("nome"));
                professores.add(professor);
            }
            return professores;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    public void delete(Professor professor) {
        try {
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(DELETE);
            stmt.setLong(1, professor.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
}
