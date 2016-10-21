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
    
    
    public static java.util.Date datetimeToDB(String stringDate){        
        java.util.Date datetime = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        try{
            datetime = simpleDateFormat.parse(stringDate);
        }
        catch (ParseException ex){
            ex.printStackTrace();
        }
        return datetime;
    }
    
    public static String datetimeFromDB (java.util.Date datetime){
        SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm");
        return sdf.format(datetime);
    }
}
