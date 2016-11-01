/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Kato
 */
public class Correcao implements Serializable{
    
    private int id;
    private String comentario;
    private Double nota;
    private Solucao solucao;
    private Aluno aluno;
    private Date correcao_data;
    
    public Correcao(){
        solucao  = new Solucao();
        aluno    = new Aluno();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Double getNota() {
        return nota;
    }

    public void setNota(Double nota) {
        this.nota = nota;
    }

    public Solucao getSolucao() {
        return solucao;
    }

    public void setSolucao(Solucao solucao) {
        this.solucao = solucao;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Date getCorrecao_data() {
        return correcao_data;
    }

    public void setCorrecao_data(Date correcao_data) {
        this.correcao_data = correcao_data;
    }
    public String getCD(){
        return Utils.DateUtil.datetimeFromDB(this.getCorrecao_data());
    }
}
