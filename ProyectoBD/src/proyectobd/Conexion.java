/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectobd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lcsan
 */
public class Conexion {
    protected final String database = "bdproyecto";
    protected final String hostname = "localhost";
    protected final String port = "3306";
    protected final String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database;
    protected final String username = "root";
    protected final String password = "admin";
    protected static Conexion Instancia;
    public Connection conexion;

    private Conexion(){};
    
    public static Conexion getInstancia(){
        if(Instancia==null){
            Instancia = new Conexion();
        }
        return Instancia;
    }
    
    public Connection ConexionDB() {
        try{
            conexion = DriverManager.getConnection(url, username, password);
            System.err.println("La Conexion ha sido Exitosa");
        } catch (SQLException ex) {
            System.err.println("No se ha podido realizar la Conexion");
            System.err.println("Error: "+ex.getMessage());
        }
        return conexion;
    }
    
    public ResultSet consultar(String sql){
        ResultSet resultado = null;
       try {
            Statement sentencia = DriverManager.getConnection(url, username, password).createStatement();
            resultado = sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }

    public Connection getConexion() {
        return conexion;
    }
}
