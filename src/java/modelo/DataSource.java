/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Administrador
 */
public class DataSource {
    Connection conn;
    public void conectar() throws Exception{
        String url,usuario,senha;
        usuario="root";
        senha="";
        url="jdbc:mysql://localhost/projeto";
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, usuario, senha);
    }
    public void desconectar() throws Exception{
        if(!conn.isClosed()){
            conn.close();
        }
    }
}
