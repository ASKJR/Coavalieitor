/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.io.Serializable;
import java.util.Date;

/**
 **
 * @author Kato
 */
public class Avaliacao implements Serializable{
    
    private int id;
    private String nome;
    private String descricao;
    private String requisito_adicional;
    private Date submissao_inicial;
    private Date submissao_final;
    private Date correcao_inicial;
    private Date correcao_final;
    private int num_correcao_estudante;
    private int nota_maxima;
    private String criterio_correcao;
    private Turma turma;
    
    public Avaliacao(){
        turma = new Turma();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getRequisito_adicional() {
        return requisito_adicional;
    }

    public void setRequisito_adicional(String requisito_adicional) {
        this.requisito_adicional = requisito_adicional;
    }

    public Date getSubmissao_inicial() {
        return submissao_inicial;
    }
    
    public void setSubmissao_inicial(Date submissao_inicial) {
        this.submissao_inicial = submissao_inicial;
    }

    public Date getSubmissao_final() {
        return submissao_final;
    }

    public void setSubmissao_final(Date submissao_final) {
        this.submissao_final = submissao_final;
    }

    public Date getCorrecao_inicial() {
        return correcao_inicial;
    }

    public void setCorrecao_inicial(Date correcao_inicial) {
        this.correcao_inicial = correcao_inicial;
    }

    public Date getCorrecao_final() {
        return correcao_final;
    }

    public void setCorrecao_final(Date correcao_final) {
        this.correcao_final = correcao_final;
    }

    public int getNum_correcao_estudante() {
        return num_correcao_estudante;
    }

    public void setNum_correcao_estudante(int num_correcao_estudante) {
        this.num_correcao_estudante = num_correcao_estudante;
    }

    public int getNota_maxima() {
        return nota_maxima;
    }

    public void setNota_maxima(int nota_maxima) {
        this.nota_maxima = nota_maxima;
    }

    public String getCriterio_correcao() {
        return criterio_correcao;
    }

    public void setCriterio_correcao(String criterio_correcao) {
        this.criterio_correcao = criterio_correcao;
    }

    public Turma getTurma() {
        return turma;
    }

    public void setTurma(Turma turma) {
        this.turma = turma;
    }
    //
    public String getSI(){
        return Utils.DateUtil.datetimeFromDB(this.getSubmissao_inicial());
    }
    public String getSF(){
        return Utils.DateUtil.datetimeFromDB(this.getSubmissao_final());
    }
    public String getCI(){
        return Utils.DateUtil.datetimeFromDB(this.getCorrecao_inicial());
    }
    
    public String getCF(){
        return Utils.DateUtil.datetimeFromDB(this.getCorrecao_final());
    }
}
