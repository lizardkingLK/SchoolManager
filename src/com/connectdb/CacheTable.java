package com.connectdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.microsoft.sqlserver.jdbc.SQLServerResultSet;

public class CacheTable {
	private static final String connectionURL = "jdbc:sqlserver://localhost:1433;"
								+ "instance=SQLEXPRESS;"
								+ "databaseName=SchoolManager;"
								+ "integratedSecurity=true;" ;
	
	static List<String[]> rowArraylist = new ArrayList<>();
	
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public ArrayList<String[]> getTables(String sql,int rowsAtime) {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(connectionURL);
			
			stmt = con.createStatement(SQLServerResultSet.TYPE_SS_SERVER_CURSOR_FORWARD_ONLY, +
		               SQLServerResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
			
			timerTest(rowsAtime, rs);
			rs.close();
			
			/*
	         // Perform a fetch for every 10th row in the result set.
	         rs = stmt.executeQuery(SQL);
	         timerTest(10, rs);
	         rs.close();
	         
	         // Perform a fetch for every 100th row in the result set.
	         rs = stmt.executeQuery(SQL);
	         timerTest(100, rs);
	         rs.close();
	         
	         // Perform a fetch for every 1000th row in the result set.
	         rs = stmt.executeQuery(SQL);
	         timerTest(1000, rs);
	         rs.close();
	         
	         // Perform a fetch for every 128th row (the default) in the result set.
	         rs = stmt.executeQuery(SQL);
	         timerTest(0, rs);
	         rs.close();
	         */
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(stmt != null) try { stmt.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return (ArrayList<String[]>) rowArraylist;
	}
	
	private static void timerTest(int fetchSize, ResultSet rs) {
			try {
			 	int rowCount = 0;
			 	long startTime = 0;
			 	long stopTime = 0;
			 	long runTime = 0;
			 
			 	rs.setFetchSize(fetchSize);
			 	startTime = System.currentTimeMillis();
			 	
			 	ResultSetMetaData rsmd = rs.getMetaData();
			 	int numCols = rsmd.getColumnCount();
			 	
			 	System.out.println("No. of Columns "+numCols);
			 	
			 	String[] columnArr = new String[numCols];
			 	
			 	while(rs.next()) {
			 		columnArr[0] = rs.getString(1);
			 		columnArr[1] = rs.getString(2);
			 		columnArr[2] = rs.getString(3);
			 		columnArr[3] = rs.getString(4);
			 		columnArr[4] = rs.getString(5);
			 		columnArr[5] = rs.getString(6);
			 		columnArr[6] = rs.getString(7);
			 		columnArr[7] = rs.getString(8);
			 		columnArr[8] = rs.getString(9);
			 		columnArr[9] = rs.getString(10);
			 		columnArr[10] = rs.getString(11);
			 		columnArr[11] = rs.getString(12);
			 		
			 		rowArraylist.add(columnArr);
			 		
			 		rowCount++;
			 	}
			 	
			 	stopTime = System.currentTimeMillis();
			 	runTime = stopTime - startTime;
			 
			 	System.out.println("FETCH SIZE: " + rs.getFetchSize());
			 	System.out.println("ROWS PROCESSED: " + rowCount);
			 	System.out.println("TIME TO EXECUTE: " + runTime);
			
	     	}
			catch (Exception e) {
				e.printStackTrace();
			}
	   
		}

}
