/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Correcao;
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
public class CorrecaoDao {
    
    /*SQL*/
    private final static String INSERT = 
    "INSERT INTO correcao "
   +"(comentario,nota,solucao_id,aluno_usuario_id,correcao_data) "
   +"VALUES (?,?,?,?,NOW())";
    
    private final static String SELECT_CORRECOES_BY_AVALIACAO = 
    "SELECT corr.comentario,corr.nota,corr.correcao_data ,us.nome AS corrigidoPor,"
  + "sol.resposta,us1.nome AS submetidoPor "
  + "FROM correcao corr "
  + "INNER JOIN usuario us ON (us.id = corr.aluno_usuario_id) " 
  + "INNER JOIN solucao sol ON(sol.id = corr.solucao_id) " 
  + "INNER JOIN usuario us1 ON (us1.id = sol.aluno_usuario_id) " 
  + "WHERE sol.avaliacao_id = ? ";
   
    /*DB variables*/
    private Connection con         = null;
    private ResultSet rs           = null;
    private PreparedStatement stmt = null;
    
    public CorrecaoDao(){
    }
    
    public void insert(Correcao correcao) {
        try{
            con = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(INSERT);	
            stmt.setString(1,correcao.getComentario());
            stmt.setDouble(2,correcao.getNota());
            stmt.setInt(3,correcao.getSolucao().getId());
            stmt.setInt(4,correcao.getAluno().getUser().getId());
            stmt.execute();
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try { if (stmt != null) stmt.close(); } catch (Exception e) {};
            try { if (con  != null) con.close();  } catch (Exception e) {};
        }
    }
    public List<Correcao> getCorrecoesByAvaliacao(int idAvaliacao) {
        try {
            con  = new ConnectionFactory().getConnection();
            stmt = con.prepareStatement(SELECT_CORRECOES_BY_AVALIACAO);
            stmt.setInt(1,idAvaliacao);
            List<Correcao> correcoes = new ArrayList<>();
            rs = stmt.executeQuery();
            while (rs.next()) {
                Correcao correcao = new Correcao();
                correcao.setComentario(rs.getString("comentario"));
                correcao.setNota(rs.getDouble("nota"));
                correcao.getAluno().getUser().setNome(rs.getString("corrigidoPor"));
                correcao.setCorrecao_data(rs.getTimestamp("correcao_data"));
                correcao.getSolucao().setResposta(rs.getString("resposta"));
                correcao.getSolucao().getAluno().getUser().setNome(rs.getString("submetidoPor"));
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
