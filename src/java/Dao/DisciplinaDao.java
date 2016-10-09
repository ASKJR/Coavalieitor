/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Disciplina;
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
public class DisciplinaDao {
       /*SQL*/
    private final static String INSERT = "INSERT INTO disciplina (nome,curso_id) VALUES (?,?)";
    private final static String DELETE = "DELETE FROM disciplina WHERE id=?";
    private final static String UPDATE = "UPDATE disciplina SET nome=? WHERE id=?";
    //private final static String SELECT = "SELECT * FROM instituicao";
    private final static String SELECT_BY_ID = "SELECT * FROM disciplina WHERE id=?";
    private final static String SELECT_DISCIPLINA_BY_COURSE = "SELECT * FROM disciplina WHERE curso_id=?";
    private final static String ORDER_BY = " ORDER BY nome";
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public DisciplinaDao(){
    }
    
    public void insert(Disciplina disciplina) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,disciplina.getNome());
            stmt.setInt(2,disciplina.getCurso().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void update(Disciplina disciplina){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE);	
            stmt.setString(1,disciplina.getNome());
            stmt.setInt(2,disciplina.getId());              
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void delete(Disciplina disciplina) {
        try {
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(DELETE);
            stmt.setInt(1, disciplina.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public List<Disciplina> getAllDisciplinasByCurso(int idCurso) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_DISCIPLINA_BY_COURSE + ORDER_BY);
            stmt.setInt(1, idCurso);
            List<Disciplina> disciplinas = new ArrayList<>();

            rs = stmt.executeQuery();

            while (rs.next()) {
                Disciplina disciplina = new Disciplina();
                disciplina.setId(rs.getInt("id"));
                disciplina.setNome(rs.getString("nome"));
                disciplina.getCurso().setId(rs.getInt("curso_id"));
                disciplinas.add(disciplina);
            }
            return disciplinas;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
  
    public Disciplina getDisciplinaById(int id){
        Disciplina returnDisciplina = new Disciplina();
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_BY_ID);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if(rs.next()){
                returnDisciplina.setId(rs.getInt("id"));
                returnDisciplina.setNome(rs.getString("nome"));
                returnDisciplina.getCurso().setId(rs.getInt("curso_id"));
            }
            return returnDisciplina;   
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }  
}
