/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Instituicao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kato
 */
public class InstituicaoDao {
    /*SQL*/
    private final static String INSERT = "INSERT INTO instituicao (nome) VALUES (?)";
    private final static String DELETE = "DELETE FROM instituicao WHERE id=?";
    private final static String UPDATE = "UPDATE instituicao SET nome=? WHERE id=?";
    private final static String SELECT = "SELECT * FROM instituicao";
    private final static String SELECT_BY_ID = "SELECT * FROM instituicao WHERE id=?";
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    
    public InstituicaoDao() {
    }
    
    public void insert(Instituicao instituicao) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,instituicao.getNome());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public void update(Instituicao instituicao){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE);	
            stmt.setString(1,instituicao.getNome());
            stmt.setInt(2,instituicao.getId());              
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void delete(Instituicao instituicao) {
        try {
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(DELETE);
            stmt.setInt(1, instituicao.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public List<Instituicao> getAllInstituicoes() {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT);
            List<Instituicao> instituicoes = new ArrayList<>();

            rs = stmt.executeQuery();

            while (rs.next()) {
                Instituicao instituicao = new Instituicao();
                instituicao.setId(rs.getInt("id"));
                instituicao.setNome(rs.getString("nome"));
                instituicoes.add(instituicao);
            }
            return instituicoes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    public Instituicao getInstituicaoById(int id){
        Instituicao returnInstituicao = new Instituicao();
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_BY_ID);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if(rs.next()){
                returnInstituicao.setId(rs.getInt("id"));
                returnInstituicao.setNome(rs.getString("nome"));
            }
            return returnInstituicao;   
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
}
