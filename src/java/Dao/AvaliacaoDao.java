/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Avaliacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

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
}
