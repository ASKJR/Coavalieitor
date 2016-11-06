/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.CorrecaoFinal;
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
public class CorrecaoFinalDao {
    
    /*SQL*/
    private final static String INSERT = 
    "INSERT INTO correcao_final "
   +"(feedback,nota_final,avaliacao_id,aluno_usuario_id,correcao_final_data) "
   +"VALUES (?,?,?,?,NOW()) ";
    
    private final static String UPDATE =
    "UPDATE correcao_final "
   +"SET feedback=?, nota_final=?,correcao_final_data=NOW() "
   +"WHERE id = ?";
    
    private final static String UPDATE_VISIBILIDADE_CORRECAO =
    "UPDATE correcao_final "
   +"SET correcao_visivel = ? "
   +"WHERE avaliacao_id = ? ";
    
    private final static String SELECT_CORRECAO_FINAL_BY_AVALIACAO = 
    "SELECT mat.*,us.nome,cf.* " 
   +"FROM matricula mat "
   +"JOIN usuario us ON (us.id = mat.aluno_usuario_id) "
   +"LEFT JOIN correcao_final cf ON (cf.aluno_usuario_id = mat.aluno_usuario_id AND cf.avaliacao_id= ?) "
   +"WHERE turma_id = ? ";
    
    private final static String SELECT_CORRECAO_FINAL_BY_ALUNO =
    "SELECT aval.nome AS avaliacao, aval.descricao,cf.* " 
   +"FROM correcao_final cf "
   +"JOIN avaliacao aval ON (cf.avaliacao_id = aval.id) "
   +"JOIN turma tur ON (aval.turma_id = tur.id) "
   +"WHERE tur.id = ? "
   +"AND cf.aluno_usuario_id = ? "
   +"AND cf.correcao_visivel = ? ";
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public CorrecaoFinalDao(){
    }
    
    public void insert(CorrecaoFinal correcaoFinal) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,correcaoFinal.getFeedback());
            stmt.setDouble(2,correcaoFinal.getNota_final());
            stmt.setInt(3,correcaoFinal.getAvaliacao().getId());
            stmt.setInt(4,correcaoFinal.getAluno().getUser().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public void update(CorrecaoFinal correcaoFinal){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE);	
            stmt.setString(1,correcaoFinal.getFeedback());
            stmt.setDouble(2,correcaoFinal.getNota_final());
            stmt.setInt(3,correcaoFinal.getId());
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public void updateVisibilidadeCorrecao(int idAvaliacao, boolean isCorrecaoVisible){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE_VISIBILIDADE_CORRECAO);	
            stmt.setBoolean(1, isCorrecaoVisible);
            stmt.setInt(2, idAvaliacao);
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public List<CorrecaoFinal> getCorrecoesFinalByAvaliacao(int idTurma,int idAvaliacao) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_CORRECAO_FINAL_BY_AVALIACAO);
            stmt.setInt(1,idAvaliacao);
            stmt.setInt(2,idTurma);
            List<CorrecaoFinal> correcoes = new ArrayList<>();
            rs = stmt.executeQuery();
            while (rs.next()) {
                CorrecaoFinal correcao = new CorrecaoFinal();
                correcao.getAluno().getUser().setId(rs.getInt("aluno_usuario_id"));
                correcao.getAluno().getUser().setNome(rs.getString("nome"));
                correcao.getAvaliacao().setId(rs.getInt("avaliacao_id"));
                correcao.setId(rs.getInt("id"));
                correcao.setFeedback(rs.getString("feedback"));
                correcao.setNota_final(rs.getDouble("nota_final"));
                correcao.setCorrecao_visivel(rs.getBoolean("correcao_visivel"));
                correcao.setCorrecao_final_data(rs.getTimestamp("correcao_final_data"));
                correcoes.add(correcao);
            }
            return correcoes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    
    public List<CorrecaoFinal> getCorrecoesFinalByAluno(int idTurma,int idAluno,boolean visibilidade) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_CORRECAO_FINAL_BY_ALUNO);
            stmt.setInt(1,idTurma);
            stmt.setInt(2,idAluno);
            stmt.setBoolean(3,visibilidade);
            List<CorrecaoFinal> correcoes = new ArrayList<>();
            rs = stmt.executeQuery();
            while (rs.next()) {
                CorrecaoFinal correcao = new CorrecaoFinal();
                correcao.getAvaliacao().setNome(rs.getString("avaliacao"));
                correcao.getAvaliacao().setDescricao(rs.getString("descricao"));
                correcao.setId(rs.getInt("id"));
                correcao.setFeedback(rs.getString("feedback"));
                correcao.setNota_final(rs.getDouble("nota_final"));
                correcao.getAvaliacao().setId(rs.getInt("avaliacao_id"));
                correcao.getAluno().getUser().setId(rs.getInt("aluno_usuario_id"));
                correcao.setCorrecao_visivel(rs.getBoolean("correcao_visivel"));
                correcao.setCorrecao_final_data(rs.getTimestamp("correcao_final_data"));
                correcoes.add(correcao);
            }
            return correcoes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
}
