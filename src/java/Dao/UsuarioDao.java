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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Welyngton
 */
public class UsuarioDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO usuario (email, senha) VALUES (?,MD5(?))";
    private final static String DELETE = "DELETE FROM usuario WHERE id_usuario=?";
    private final static String UPDATE = "UPDATE usuario SET email=?, senha=MD5(?) WHERE id_usuario=?";
    private final static String SELECT = "SELECT * FROM usuario";
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;

    public UsuarioDao() {
    }
    public void insert(Usuario usuario) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,usuario.getEmail());
            stmt.setString(2,usuario.getSenha());  //Criptografar          
            stmt.execute();
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
                usuario.setId(rs.getInt("id_usuario"));
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
    
}
