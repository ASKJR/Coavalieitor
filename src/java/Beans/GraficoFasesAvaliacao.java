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
    private int emAndamento;
    private int finalizadas;

    /**
     * @return the naoIniciadas
     */
    public int getNaoIniciadas() {
        return naoIniciadas;
    }

    public void setNaoIniciadas(int naoIniciadas) {
        this.naoIniciadas = naoIniciadas;
    }

    public int getEmAndamento() {
        return emAndamento;
    }

    public void setEmAndamento(int emAndamento) {
        this.emAndamento = emAndamento;
    }

    public int getFinalizadas() {
        return finalizadas;
    }

    public void setFinalizadas(int finalizadas) {
        this.finalizadas = finalizadas;
    }
    
    
}
