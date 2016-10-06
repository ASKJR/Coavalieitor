/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Curso;
import Beans.Instituicao;
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
public class CursoDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO curso (nome,instituicao_id) VALUES (?,?)";
    private final static String DELETE = "DELETE FROM curso WHERE id=?";
    private final static String UPDATE = "UPDATE curso SET nome=? WHERE id=?";
    //private final static String SELECT = "SELECT * FROM instituicao";
    private final static String SELECT_BY_ID = "SELECT * FROM curso WHERE id=?";
    private final static String SELECT_COURSE_BY_INST = "SELECT * FROM curso WHERE instituicao_id=?";
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public CursoDao(){
    }
    
    public void insert(Curso curso) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,curso.getNome());
            stmt.setInt(2,curso.getInstituicao().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void update(Curso curso){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE);	
            stmt.setString(1,curso.getNome());
            stmt.setInt(2,curso.getId());              
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void delete(Curso curso) {
        try {
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(DELETE);
            stmt.setInt(1, curso.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public List<Curso> getAllCursosByInsituicao(int idInstituicao) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_COURSE_BY_INST);
            stmt.setInt(1, idInstituicao);
            List<Curso> cursos = new ArrayList<>();

            rs = stmt.executeQuery();

            while (rs.next()) {
                Curso curso = new Curso();
                curso.setId(rs.getInt("id"));
                curso.setNome(rs.getString("nome"));
                curso.getInstituicao().setId(rs.getInt("instituicao_id"));
                cursos.add(curso);
            }
            return cursos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
  
    public Curso getCursoById(int id){
        Curso returnCurso = new Curso();
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_BY_ID);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if(rs.next()){
                returnCurso.setId(rs.getInt("id"));
                returnCurso.setNome(rs.getString("nome"));
                returnCurso.getInstituicao().setId(rs.getInt("instituicao_id"));
            }
            return returnCurso;   
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    
}
