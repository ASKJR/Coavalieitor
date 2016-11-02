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
public class CorrecaoFinal implements Serializable{
    
    private int id;
    private String feedback;
    private Double nota_final;
    private Avaliacao avaliacao;
    private Aluno aluno;
    private Boolean correcao_visivel;
    private Date correcao_final_data;
    
    public CorrecaoFinal(){
        avaliacao = new Avaliacao();
        aluno     = new Aluno();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Double getNota_final() {
        return nota_final;
    }

    public void setNota_final(Double nota_final) {
        this.nota_final = nota_final;
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

    public Boolean getCorrecao_visivel() {
        return correcao_visivel;
    }

    public void setCorrecao_visivel(Boolean correcao_visivel) {
        this.correcao_visivel = correcao_visivel;
    }

    public Date getCorrecao_final_data() {
        return correcao_final_data;
    }

    public void setCorrecao_final_data(Date correcao_final_data) {
        this.correcao_final_data = correcao_final_data;
    }
    
    public String getCF(){
        return Utils.DateUtil.datetimeFromDB(this.getCorrecao_final_data());
    }
}
