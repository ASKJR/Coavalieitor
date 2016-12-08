/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.io.Serializable;


/**
 *
 * @author Welyngton
 */
public class GraficoFasesAvaliacao implements Serializable{
    
    private int naoIniciadas;        
    private int emSubmissão;
    private int emCorrecao;
    private int finalizadas;

    public int getNaoIniciadas() {
        return naoIniciadas;
    }

    public void setNaoIniciadas(int naoIniciadas) {
        this.naoIniciadas = naoIniciadas;
    }

    public int getEmSubmissão() {
        return emSubmissão;
    }

    public void setEmSubmissão(int emSubmissão) {
        this.emSubmissão = emSubmissão;
    }

    public int getEmCorrecao() {
        return emCorrecao;
    }

    public void setEmCorrecao(int emCorrecao) {
        this.emCorrecao = emCorrecao;
    }

    public int getFinalizadas() {
        return finalizadas;
    }

    public void setFinalizadas(int finalizadas) {
        this.finalizadas = finalizadas;
    }
    
}