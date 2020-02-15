package com.connectdb;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectSchoolManager {
	// Create a variable for the connection string.
	public static final String connectionURL = "jdbc:sqlserver://localhost:1433;"
												+ "instance=SQLEXPRESS;"
												+ "databaseName=SchoolManager;"
												+ "integratedSecurity=true;" ;
	// Declare the JDBC objects.
	public static Connection con = null;

	public static Connection doConnect() {
		try {
			// Establish the connection.
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(connectionURL);
		}
		
		// Handle any errors that may have occurred.
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
