/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Avaliacao;
import Beans.Turma;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kato
 */
public class AvaliacaoDao {
    
    /*SQL*/
    private final static String INSERT = 
    "INSERT INTO avaliacao (nome,descricao,requisito_adicional,submissao_inicial,submissao_final,"
   +"correcao_inicial,correcao_final,num_correcao_estudante,nota_maxima,criterio_correcao,turma_id) "
   +"VALUES (?,?,?,?,?,?,?,?,?,?,?) ";
    
    private final static String UPDATE = 
    "UPDATE avaliacao SET "
    +"nome=?, descricao=?, requisito_adicional=?,submissao_inicial=?,submissao_final=?, "
    +"correcao_inicial=?,correcao_final=?,num_correcao_estudante=?,"
    +"nota_maxima=?,criterio_correcao=? "
    +"WHERE id=?";
    
    private final static String DELETE = "DELETE FROM avaliacao WHERE id=?";
    private final static String SELECT_AVALIACAO_BY_ID = "SELECT * FROM avaliacao WHERE id=?";
    private final static String SELECT_AVALIACOES_BY_TURMA = "SELECT * FROM avaliacao WHERE turma_id=?";
    
    
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public void insert(Avaliacao avaliacao) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,avaliacao.getNome());
            stmt.setString(2,avaliacao.getDescricao());
            stmt.setString(3,avaliacao.getRequisito_adicional());
            stmt.setTimestamp(4,new Timestamp(avaliacao.getSubmissao_inicial().getTime()));
            stmt.setTimestamp(5,new Timestamp(avaliacao.getSubmissao_final().getTime()));
            stmt.setTimestamp(6,new Timestamp(avaliacao.getCorrecao_inicial().getTime()));
            stmt.setTimestamp(7,new Timestamp(avaliacao.getCorrecao_final().getTime()));
            stmt.setInt(8,avaliacao.getNum_correcao_estudante());
            stmt.setInt(9,avaliacao.getNota_maxima());
            stmt.setString(10,avaliacao.getCriterio_correcao());
            stmt.setInt(11,avaliacao.getTurma().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public void update(Avaliacao avaliacao){
        try{
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(UPDATE);	
            stmt.setString(1,avaliacao.getNome());
            stmt.setString(2,avaliacao.getDescricao());
            stmt.setString(3,avaliacao.getRequisito_adicional());
            stmt.setTimestamp(4,new Timestamp(avaliacao.getSubmissao_inicial().getTime()));
            stmt.setTimestamp(5,new Timestamp(avaliacao.getSubmissao_final().getTime()));
            stmt.setTimestamp(6,new Timestamp(avaliacao.getCorrecao_inicial().getTime()));
            stmt.setTimestamp(7,new Timestamp(avaliacao.getCorrecao_final().getTime()));
            stmt.setInt(8,avaliacao.getNum_correcao_estudante());
            stmt.setInt(9,avaliacao.getNota_maxima());
            stmt.setString(10,avaliacao.getCriterio_correcao());
            stmt.setInt(11,avaliacao.getId());
            stmt.execute();
        }catch(SQLException e){
                 throw new RuntimeException(e);
        }finally{
                 try { if (stmt != null) stmt.close(); } catch (Exception e) {};
                 try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    
    public void delete(Avaliacao avaliacao) {
        try {
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(DELETE);
            stmt.setInt(1, avaliacao.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    
    public List<Avaliacao> getAvaliacoesByTurma(int idTurma){
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_AVALIACOES_BY_TURMA);
            stmt.setInt(1,idTurma);
            List<Avaliacao> avaliacoes = new ArrayList<>();
            rs = stmt.executeQuery();
            while (rs.next()) {
                Avaliacao avaliacao = new Avaliacao();
                avaliacao.setId(rs.getInt("id"));
                avaliacao.setNome(rs.getString("nome"));
                avaliacao.setDescricao(rs.getString("descricao"));
                avaliacao.setRequisito_adicional(rs.getString("requisito_adicional"));
                avaliacao.setSubmissao_inicial(rs.getTimestamp("submissao_inicial"));
                avaliacao.setSubmissao_final(rs.getTimestamp("submissao_final"));
                avaliacao.setCorrecao_inicial(rs.getTimestamp("correcao_inicial"));
                avaliacao.setCorrecao_final(rs.getTimestamp("correcao_final"));
                avaliacao.setNum_correcao_estudante(rs.getInt("num_correcao_estudante"));
                avaliacao.setNota_maxima(rs.getInt("nota_maxima"));
                avaliacao.setCriterio_correcao(rs.getString("criterio_correcao"));
                avaliacao.getTurma().setId(rs.getInt("turma_id"));
                avaliacao.setStatus_id(rs.getInt("status_id"));
                avaliacoes.add(avaliacao);
            }
            return avaliacoes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
    
    public Avaliacao getAvaliacaoById(int idAvaliacao){
        try{
            Avaliacao avaliacao = new Avaliacao();
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_AVALIACAO_BY_ID);
            stmt.setInt(1,idAvaliacao);
            rs = stmt.executeQuery();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm");
            if(rs.next()){
                avaliacao.setId(rs.getInt("id"));
                avaliacao.setNome(rs.getString("nome"));
                avaliacao.setDescricao(rs.getString("descricao"));
                avaliacao.setRequisito_adicional(rs.getString("requisito_adicional"));
                avaliacao.setSubmissao_inicial(rs.getTimestamp("submissao_inicial"));
                avaliacao.setSubmissao_final(rs.getTimestamp("submissao_final"));
                avaliacao.setCorrecao_inicial(rs.getTimestamp("correcao_inicial"));
                avaliacao.setCorrecao_final(rs.getTimestamp("correcao_final"));
                avaliacao.setNum_correcao_estudante(rs.getInt("num_correcao_estudante"));
                avaliacao.setNota_maxima(rs.getInt("nota_maxima"));
                avaliacao.setCriterio_correcao(rs.getString("criterio_correcao"));
                avaliacao.getTurma().setId(rs.getInt("turma_id"));
                avaliacao.setStatus_id(rs.getInt("status_id"));
            }
            return avaliacao;   
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (rs   != null) stmt.close();   } catch (Exception e) {};
            try { if (stmt != null) stmt.close();   } catch (Exception e) {};
            try { if (con  != null) con.close();    } catch (Exception e) {};
        }
    }
}
