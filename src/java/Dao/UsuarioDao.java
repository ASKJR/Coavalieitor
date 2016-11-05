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
    private final static String INSERT = "INSERT INTO usuario (email, senha,nome,perfil_id) VALUES (?,MD5(?),?,?)";
    private final static String DELETE = "DELETE FROM usuario WHERE id=?";
    private final static String UPDATE_USER_INFO = "UPDATE usuario SET nome=?, telefone=?, nascimento=?, sexo=? WHERE id=?";
    private final static String UPDATE_USER_SENHA = "UPDATE usuario SET senha=MD5(?) WHERE id=?";
    private final static String UPDATE_USER_SENHA_BY_EMAIL = "UPDATE usuario SET senha=MD5(?) WHERE email=?";
    private final static String SELECT = "SELECT * FROM usuario";
    private final static String SELECT_BY_ID = "SELECT * FROM usuario WHERE id=?";
    private final static String SELECT_EMAIL = "SELECT email FROM usuario WHERE email=?";
    private final static String SELECT_SENHA = "SELECT senha FROM usuario WHERE id=? AND senha=MD5(?)";
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
            stmt.setInt(4,usuario.getPerfil_id());
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
            stmt = con.prepareStatement(UPDATE_USER_INFO);	
            stmt.setString(1,usuario.getNome());
            stmt.setString(2,usuario.getTelefone());
            stmt.setDate(3,usuario.getNascimento());              
            stmt.setString(4,usuario.getSexo());
            stmt.setLong(5,usuario.getId());
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public void updateSenha(Usuario usuario){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE_USER_SENHA);	
            stmt.setString(1,usuario.getSenha());
            stmt.setLong(2,usuario.getId());
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    
    public void updateSenhaByEmail(String senhaTemp,String email){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE_USER_SENHA_BY_EMAIL);	
            stmt.setString(1,senhaTemp);
            stmt.setString(2,email);
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
    public boolean senhaConfere(Usuario usuario){
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_SENHA);
            stmt.setInt(1,usuario.getId());
            stmt.setString(2,usuario.getSenha());
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
    
     public Usuario getUsuarioById(int id){
        Usuario returnUsuario = new Usuario();
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_BY_ID);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if(rs.next()){
                returnUsuario.setId(rs.getInt("id"));
                returnUsuario.setEmail(rs.getString("email"));
                returnUsuario.setSenha(rs.getString("senha"));
                returnUsuario.setNome(rs.getString("nome"));
                returnUsuario.setTelefone(rs.getString("telefone"));
                returnUsuario.setNascimento(rs.getDate("nascimento"));
                returnUsuario.setSexo(rs.getString("sexo"));
                returnUsuario.setPerfil_id(rs.getInt("perfil_id"));
            }
            return returnUsuario;   
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
}
