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
public class Solucao implements Serializable {
    
    private int id;
    private String resposta;
    private Avaliacao avaliacao;
    private Aluno aluno;
    private Date solucao_data;
    
    public Solucao(){
        avaliacao = new Avaliacao();
        aluno     = new Aluno();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }

    public Avaliacao getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(Avaliacao avaliacao) {
        this.avaliacao = avaliacao;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Date getSolucao_data() {
        return solucao_data;
    }

    public void setSolucao_data(Date solucao_data) {
        this.solucao_data = solucao_data;
    }
    public String getSD(){
        return Utils.DateUtil.datetimeFromDB(this.getSolucao_data());
    }
}
