/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
import Beans.Turma;
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
public class TurmaDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO turma (nome,palavra_chave,disciplina_id,professor_usuario_id) VALUES (?,?,?,?)";
    private final static String DELETE = "DELETE FROM turma WHERE id=?";
    private final static String UPDATE = "UPDATE turma SET nome=? WHERE id=?";
    //private final static String SELECT = "SELECT * FROM instituicao";
    private final static String SELECT_BY_ID = "SELECT * FROM turma WHERE id=?";
    
    
    private final static String SELECT_TURMAS_BY_PROFESSOR = "SELECT * "
                                                           + "FROM turma WHERE "
                                                           + "disciplina_id=? "
                                                           + "AND "
                                                           + "professor_usuario_id=?";
    
    
    private final static String ORDER_BY = " ORDER BY nome";
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public TurmaDao(){
    }
    
    public void insert(Turma turma) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,turma.getNome());
            stmt.setString(2,turma.getPalavra_chave());
            stmt.setInt(3,turma.getDisciplina().getId());
            stmt.setInt(4,turma.getProfessor().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void update(Turma turma){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE);	
            stmt.setString(1,turma.getNome());
            stmt.setInt(2,turma.getId());              
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void delete(Turma turma) {
        try {
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(DELETE);
            stmt.setInt(1, turma.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public List<Turma> getAllTurmas(int disciplina_id,int professor_usuario_id) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_TURMAS_BY_PROFESSOR);
            stmt.setInt(1, disciplina_id);
            stmt.setInt(2,professor_usuario_id);
            List<Turma> turmas = new ArrayList<>();

            rs = stmt.executeQuery();

            while (rs.next()) {
                Turma turma = new Turma();
                turma.setId(rs.getInt("id"));
                turma.setNome(rs.getString("nome"));
                turma.getDisciplina().setId(rs.getInt("disciplina_id"));
                turma.getProfessor().setId(rs.getInt("professor_usuario_id"));
            }
            return turmas;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
  
    public Turma getTurmaById(int id){
        Turma returnTurma = new Turma();
        try{
            Turma turma = new Turma();
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_BY_ID);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if(rs.next()){
                turma.setId(rs.getInt("id"));
                turma.setNome(rs.getString("nome"));
                turma.getDisciplina().setId(rs.getInt("disciplina_id"));
                turma.getProfessor().setId(rs.getInt("professor_usuario_id"));
            }
            return returnTurma;   
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
}
