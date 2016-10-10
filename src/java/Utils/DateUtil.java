/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


/**
 *
 * @author Kato
 */
public class DateUtil {
    public static Date dateToDB(String stringDate){        
        Date d = null;
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        try { 
            d = new java.sql.Date(df.parse(stringDate).getTime());
        } catch (ParseException ex) {
            ex.printStackTrace();         
        }
        return d;
    }
}
