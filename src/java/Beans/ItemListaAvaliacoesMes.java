/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 * @author Welyngton
 */
public class ItemListaAvaliacoesMes {
    
    private String mes;
    private String ano;
    private int qtdAvaliacoes;

    public String getData() {
        
        String retMes = mes;
                
        switch(mes) {
            case "1":
              retMes = "Jan";
            case "2":
              retMes = "Fev";
            case "3":
              retMes = "Mar";              
            case "4":
              retMes = "Abr";
            case "5":
              retMes = "Mai";              
            case "6":
              retMes = "Jun";              
            case "7":
              retMes = "Jul"; 
            case "8":
              retMes = "Ago";
            case "9":
              retMes = "Set";              
            case "10":
              retMes = "Out";
            case "11":
              retMes = "Nov";              
            case "12":
              retMes = "Dez";               
            default:
             break;
        }
        return retMes+"/"+ano;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public int getAvaliacoes() {
        return getQtdAvaliacoes();
    }

    public void setQtdAvaliacoes(int qtdAvaliacoes) {
        this.qtdAvaliacoes = qtdAvaliacoes;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public int getQtdAvaliacoes() {
        return qtdAvaliacoes;
    }
    
    public String getMes(){
        return mes;
    }    
}
