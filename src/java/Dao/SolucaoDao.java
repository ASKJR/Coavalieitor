/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Solucao;
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
    
    //Módulo Professor
    private final static String SELECT_SOLUCOES_BY_AVALIACAO =
    "SELECT sol.*,us.nome "
   +"FROM matricula mat "
   +"LEFT JOIN usuario us ON (us.id = mat.aluno_usuario_id) "
   +"LEFT JOIN avaliacao aval ON (mat.turma_id = aval.turma_id) "
   +"LEFT JOIN solucao sol ON(sol.aluno_usuario_id = mat.aluno_usuario_id AND sol.avaliacao_id = aval.id) "
   +"WHERE mat.turma_id = ? "
   +"AND aval.id = ? ";
    
    //Módulo Aluno
    //TODO: select soluções de forma randomica
    //TODO: select soluções respeitando o limit estabelecido pelo professor
    private final static String SELECT_SOLUCOES_FOR_STUDENT = 
    "SELECT sol.id,sol.resposta,aval.criterio_correcao,aval.nota_maxima,"
  + "aval.nome,aval.descricao,aval.requisito_adicional "
  + "FROM solucao sol "
  + "INNER JOIN avaliacao aval ON (sol.avaliacao_id = aval.id) "
  + "WHERE aval.id =? ";          
    
    //Módulo Aluno
    private final static String SELECT_SOLUCAO_BY_ID =
    "SELECT sol.id,sol.resposta,aval.criterio_correcao,aval.nota_maxima,"
  + "aval.nome,aval.descricao,aval.requisito_adicional "
  + "FROM solucao sol "
  + "INNER JOIN avaliacao aval ON (sol.avaliacao_id = aval.id) "
  + "WHERE sol.id =? ";          
  
    
    
    
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
    
    //Módulo Aluno. Ajuda a verificar se um aluno já submeteu uma avaliação
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
    
    //Módulo Professor
    public List<Solucao> getSolucoesByAvaliacao(int idTurma, int idAvaliacao) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_SOLUCOES_BY_AVALIACAO);
            stmt.setInt(1,idTurma);
            stmt.setInt(2,idAvaliacao);
            List<Solucao> solucoes = new ArrayList<>();
            rs = stmt.executeQuery();
            while (rs.next()) {
                Solucao solucao = new Solucao();
                solucao.setId(rs.getInt("id"));
                solucao.setResposta(rs.getString("resposta"));
                solucao.getAvaliacao().setId(rs.getInt("avaliacao_id"));
                solucao.getAluno().getUser().setId(rs.getInt("aluno_usuario_id"));
                solucao.getAluno().getUser().setNome(rs.getString("nome"));
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
    
    
    //Módulo aluno
    //TODO: select soluções de forma randomica
    //TODO: select soluções respeitando o limit estabelecido pelo professor
    public List<Solucao> getSolucoesForAluno(int idAvaliacao) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_SOLUCOES_FOR_STUDENT);
            stmt.setInt(1,idAvaliacao);
            List<Solucao> solucoes = new ArrayList<>();
            rs = stmt.executeQuery();
            while (rs.next()) {
                Solucao solucao = new Solucao();
                solucao.setId(rs.getInt("id"));
                solucao.setResposta(rs.getString("resposta"));
                solucao.getAvaliacao().setCriterio_correcao(rs.getString("criterio_correcao"));
                solucao.getAvaliacao().setNota_maxima(rs.getInt("nota_maxima"));
                solucao.getAvaliacao().setNome(rs.getString("nome"));
                solucao.getAvaliacao().setDescricao(rs.getString("descricao"));
                solucao.getAvaliacao().setRequisito_adicional(rs.getString("requisito_adicional"));
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
    
    public Solucao getSolucaoById(int idSolucao){
        try{
            Solucao solucao = new Solucao();
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_SOLUCAO_BY_ID);
            stmt.setInt(1,idSolucao);
            rs = stmt.executeQuery();
            if(rs.next()){
                solucao.setId(rs.getInt("id"));
                solucao.setResposta(rs.getString("resposta"));
                solucao.getAvaliacao().setCriterio_correcao(rs.getString("criterio_correcao"));
                solucao.getAvaliacao().setNota_maxima(rs.getInt("nota_maxima"));
                solucao.getAvaliacao().setNome(rs.getString("nome"));
                solucao.getAvaliacao().setDescricao(rs.getString("descricao"));
                solucao.getAvaliacao().setRequisito_adicional(rs.getString("requisito_adicional"));
            }
            return solucao;   
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    
}
