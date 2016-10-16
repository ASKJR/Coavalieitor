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
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Kato
 */
public class AlunoDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO aluno (usuario_id) VALUES (?)";
    private final static String SELECT_ALL ="SELECT * FROM usuario us "
                                          + "JOIN aluno al on (us.id = al.usuario_id)"; 
    
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
    public List<Aluno> getAllAlunos(String filtro){
        try {
            if(filtro==null||filtro.equals("")){
                filtro = "";
            }
            else{
                filtro = " WHERE us.nome LIKE '%" + filtro + "%' "; 
            }
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_ALL + filtro + " ORDER BY us.nome");
            List<Aluno> alunos = new ArrayList<>();
            rs = stmt.executeQuery();
            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setId(rs.getInt("id"));
                aluno.getUser().setEmail(rs.getString("email"));
                aluno.getUser().setSenha(rs.getString("senha"));
                aluno.getUser().setNome(rs.getString("nome"));
                aluno.getUser().setTelefone(rs.getString("telefone"));
                aluno.getUser().setNascimento(rs.getDate("nascimento"));
                aluno.getUser().setSexo(rs.getString("sexo"));
                alunos.add(aluno);
            }
            return alunos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
}
