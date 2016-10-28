/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Solucao;
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
public class SolucaoDao {
    
    /*SQL*/
    private final static String INSERT = 
    "INSERT INTO solucao "
   +"(resposta,avaliacao_id,aluno_usuario_id,solucao_data) "
   +"VALUES (?,?,?,NOW())";         
    
    private final static String SELECT_SOLUCOES_BY_ALUNO =
    "SELECT * FROM solucao "
   +"WHERE aluno_usuario_id =?";
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public SolucaoDao(){
    }
    
    public void insert(Solucao solucao) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,solucao.getResposta());
            stmt.setInt(2,solucao.getAvaliacao().getId());
            stmt.setInt(3,solucao.getAluno().getUser().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public List<Solucao> getSolucoesByAluno(int idAluno) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_SOLUCOES_BY_ALUNO);
            stmt.setInt(1,idAluno);
            List<Solucao> solucoes = new ArrayList<>();
            rs = stmt.executeQuery();
            while (rs.next()) {
                Solucao solucao = new Solucao();
                solucao.setId(rs.getInt("id"));
                solucao.setResposta(rs.getString("resposta"));
                solucao.getAvaliacao().setId(rs.getInt("avaliacao_id"));
                solucao.getAluno().getUser().setId(rs.getInt("aluno_usuario_id"));
                solucao.setSolucao_data(rs.getTimestamp("solucao_data"));
                solucoes.add(solucao);
            }
            return solucoes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
}
