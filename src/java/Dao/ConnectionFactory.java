/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Kato
 */
public class ConnectionFactory {
    public Connection getConnection() {
        try {
            //?autoReconnect=true&useSSL=false
            String db       = "jdbc:mysql://localhost/contactDB";
	    String user     = "root";
	    String password = "";
	    Connection con = (Connection)DriverManager.getConnection(db,user,password);
            return con; 
	}catch(SQLException e) {
            throw new RuntimeException(e);
	}
    }
}
