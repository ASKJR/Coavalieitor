/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 * @author Welyngton
 */
public class ItemListaMediaMes {
    
    private String mes;
    private String ano;
    private String turma;
    private String media;

    public String getData() {
        
        String retMes = getMes();
                
        switch(getMes()) {
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
        return retMes+"/"+getAno();
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getTurma() {
        return turma;
    }

    public void setTurma(String turma) {
        this.turma = turma;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }
}
