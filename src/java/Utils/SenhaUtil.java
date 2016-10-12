/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import org.apache.commons.lang3.RandomStringUtils;


/**
 *
 * @author Kato
 */
public class SenhaUtil {
    public static String gerarSenha(){
        String senhaAleatoria = RandomStringUtils.randomAlphanumeric(8); 
        return senhaAleatoria;
    }
}
