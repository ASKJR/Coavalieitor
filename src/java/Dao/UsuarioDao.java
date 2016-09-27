/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Welyngton
 */
public class UsuarioDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO usuario (email, senha,nome) VALUES (?,MD5(?),?)";
    private final static String DELETE = "DELETE FROM usuario WHERE id=?";
    private final static String UPDATE = "UPDATE usuario SET email=?, senha=MD5(?) WHERE id=?";
    private final static String SELECT = "SELECT * FROM usuario";
    private final static String SELECT_EMAIL = "SELECT email FROM usuario WHERE email=?"; 
    private final static String SELECT_LOGIN = "SELECT * FROM usuario WHERE email=? AND senha=MD5(?)";
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;

    public UsuarioDao() {
    }
    //Além de inserir um usuário no BD,retorna o ID recém inserido para inserir
    //registros nas tabela de professor, ou aluno
    public int insert(Usuario usuario) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT,Statement.RETURN_GENERATED_KEYS);	
            stmt.setString(1,usuario.getEmail());
            stmt.setString(2,usuario.getSenha());  //Criptografar 
            stmt.setString(3,usuario.getNome());
            stmt.execute();
            rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getInt(1);
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void update(Usuario usuario){
        try{
                con  = new ConnectionFactory().getConnection();
                stmt = con.prepareStatement(UPDATE);	
                stmt.setString(1,usuario.getEmail());
                stmt.setString(2,usuario.getSenha());  //Criptografar              
                stmt.setLong(3,usuario.getId());
                stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public List<Usuario> getAllUsuarios() {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT);
            List<Usuario> usuarios = new ArrayList<>();

            rs = stmt.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setEmail(rs.getString("email"));
                usuarios.add(usuario);
            }
            return usuarios;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    public void delete(Usuario usuario) {
        try {
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(DELETE);
            stmt.setLong(1, usuario.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public boolean emailExists(String email){
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_EMAIL);
            stmt.setString(1,email);
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
    //retorna o id do usuario,caso exista no banco de dados.
    //caso contrário retorna -1
    public int login(Usuario usuario){
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_LOGIN);
            stmt.setString(1,usuario.getEmail());
            stmt.setString(2,usuario.getSenha());
            rs = stmt.executeQuery();    
            if(rs.next()){
               return rs.getInt("id");
            }
            return -1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
}
