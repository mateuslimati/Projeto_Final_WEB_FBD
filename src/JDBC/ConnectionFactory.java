package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	private final String ip = "localhost"; 
	private final Integer port = 5432;
	private final String user = "postgres"; //usuario do postgres
	private final String password = "87532905"; //senha do servidor
	private final String database = "aula_jdbc"; //
    
	public Connection getConnection() {
        try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            return DriverManager.getConnection("jdbc:postgresql://"+ ip + ":" + port + "/" + database, user, password); 
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
	
}
