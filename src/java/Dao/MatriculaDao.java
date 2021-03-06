/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Aluno;
import Beans.Matricula;
import Beans.Turma;
import Beans.Usuario;
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
public class MatriculaDao {
     /*SQL*/
    private final static String INSERT = "INSERT INTO matricula (aluno_usuario_id,turma_id) VALUES (?,?)";
    
    private final static String SELECT_MATRICULA = "SELECT * FROM matricula WHERE aluno_usuario_id=? AND turma_id =?"; 
    
    private final static String SELECT_MATRICULA_BY_TURMA = 
    "SELECT mat.*,us.*,tur.*,disc.*,cur.*,inst.* from matricula mat "
   +"JOIN usuario us ON (us.id = mat.aluno_usuario_id) "
   +"JOIN turma tur ON (tur.id = mat.turma_id) "
   +"JOIN disciplina disc ON(tur.disciplina_id = disc.id) "
   +"JOIN curso  cur ON(disc.curso_id = cur.id) "
   +"JOIN instituicao inst ON (cur.instituicao_id = inst.id) "       
   +"WHERE mat.turma_id=? ORDER BY us.nome "; 
    
    
    private final static String DELETE_MATRICULA =
    "DELETE FROM matricula "
    +"WHERE aluno_usuario_id=? AND "
    +"turma_id=? ";
    
    private final static String SELECT_MATRIBULA_BY_ALUNO = 
    "SELECT mat.*,tur.nome AS turma ,disc.nome AS disciplina, prof.nome AS professor "
   +"FROM matricula mat "
   +"INNER JOIN turma tur ON (mat.turma_id = tur.id) "
   +"INNER JOIN usuario prof ON (tur.professor_usuario_id = prof.id) "
   +"INNER JOIN disciplina disc ON (tur.disciplina_id = disc.id) "
   +"WHERE aluno_usuario_id=? ";
    
    /*DB variables*/
    
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    
    public MatriculaDao() {
    }
    
    public void insert(Matricula matricula) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setInt(1,matricula.getAluno().getId());
            stmt.setInt(2,matricula.getTurma().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void delete(int idAluno,int idTurma) {
        try {
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(DELETE_MATRICULA);
            stmt.setInt(1,idAluno);
            stmt.setInt(2,idTurma);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public boolean matriculaExist(int idAluno,int idTurma){
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_MATRICULA);
            stmt.setInt(1,idAluno);
            stmt.setInt(2,idTurma);
            rs = stmt.executeQuery();
            
            return rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        } 
    }
    public List<Matricula> getAllMatriculasByTurma(int idTurma) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_MATRICULA_BY_TURMA);
            stmt.setInt(1, idTurma);
            List<Matricula> matriculas = new ArrayList<>();
            rs = stmt.executeQuery();

            while (rs.next()) {
                Matricula matricula = new Matricula();
                Usuario user = new Usuario();
                Aluno aluno  = new Aluno();
                Turma turma  = new Turma();
               
                user.setId(rs.getInt(1));
                user.setNome(rs.getString(6));
                user.setEmail(rs.getString(4));
                aluno.setUser(user);
                turma.setId(2);
                turma.setNome(rs.getString(12));
                turma.setPalavra_chave(rs.getString(13));
                turma.getDisciplina().setId(rs.getInt(14));
                turma.getProfessor().setId(rs.getInt(15));
                turma.getDisciplina().getCurso().setId(rs.getInt(18));
                turma.getDisciplina().getCurso().getInstituicao().setId(rs.getInt(21));
                matricula.setAluno(aluno);
                matricula.setTurma(turma);
                matriculas.add(matricula);
            }
            return matriculas;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    public List<Matricula> getMatriculaByAluno(int idAluno) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_MATRIBULA_BY_ALUNO);
            stmt.setInt(1, idAluno);
            List<Matricula> matriculas = new ArrayList<>();
            rs = stmt.executeQuery();

            while (rs.next()) {
                Matricula matricula = new Matricula();
                matricula.getTurma().setId(rs.getInt("turma_id"));
                matricula.getTurma().setNome(rs.getString("turma"));
                matricula.getTurma().getDisciplina().setNome(rs.getString("disciplina"));
                matricula.getTurma().getProfessor().getUser().setNome(rs.getString("professor"));
                matriculas.add(matricula);
            }
            return matriculas;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }   
}
