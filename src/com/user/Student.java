package com.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.connectdb.ConnectSchoolManager;

public class Student extends User {	
	private String enteredGrade,currentGrade;
	
	public Student() {
		super();
	}

	public Student(String id, String name, String email, String phone, String address, String birthdate,
		String registereddate, String userName, String password, String bio, String status, String enteredGrade, String currentGrade, String link) {
		super(id, name, email, phone, address, birthdate, registereddate, userName, password, bio, status, link);
		this.setEnteredGrade(enteredGrade);
		this.setCurrentGrade(currentGrade);
	}

	public String getEnteredGrade() {
		return enteredGrade;
	}

	public void setEnteredGrade(String enteredGrade) {
		this.enteredGrade = enteredGrade;
	}

	public String getCurrentGrade() {
		return currentGrade;
	}

	public void setCurrentGrade(String currentGrade) {
		this.currentGrade = currentGrade;
	}
	
	public Student loadAndSetInstance(String userID) {
		Student instanceUser = new Student();
		
		// Declare the JDBC objects.
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// Establish the connection.
			con = ConnectSchoolManager.doConnect();
			
			// Create statement to execute.
			stmt = con.createStatement();
			
			try {
				String studentID = null;
				String userName = null;
				String studentName = null;
				String enteredGrade = null;
				String currentGrade = null;
				String birthdate = null;
				String registeredDate = null;
				String phone = null;
				String address = null;
				String bio = null;
				String email = null;
				String password = null;
				String status = null;
				String link = null;
				
				// Create and execute SQL statement.
				String getInstanceQuery = "SELECT * FROM Student WHERE studentID = '"+userID+"';" ;
				rs = stmt.executeQuery(getInstanceQuery);
				
				while(rs.next()) {
					studentID = rs.getString(1); instanceUser.setId(studentID);
					userName = rs.getString(2); instanceUser.setUserName(userName);
					studentName = rs.getString(3); instanceUser.setName(studentName);
					enteredGrade = rs.getString(4); instanceUser.setEnteredGrade(enteredGrade);
					birthdate = rs.getString(5); instanceUser.setBirthdate(birthdate);
					registeredDate = rs.getString(6); instanceUser.setRegistereddate(registeredDate);
					phone = rs.getString(7); instanceUser.setPhone(phone);
					address = rs.getString(8); instanceUser.setAddress(address);
					bio = rs.getString(9); instanceUser.setBio(bio);
					email = rs.getString(10); instanceUser.setEmail(email);
					password = rs.getString(11); instanceUser.setPassword(password);
					status = rs.getString(12); instanceUser.setStatus(status);
					currentGrade = rs.getString(13); instanceUser.setCurrentGrade(currentGrade);
					link = rs.getString(14); instanceUser.setLink(link);
				}
			}
			catch(SQLException sqle) {
				System.out.println("INSIDE");
				sqle.printStackTrace();
			}
		}
		catch(Exception e) {
			System.out.println("OUTSIDE");
			e.printStackTrace();
		}
		finally {
			if(rs != null) try{ rs.close(); } catch(Exception e) {}
			if(stmt != null) try{ stmt.close(); } catch(Exception e) {}
			if(con != null) try{ con.close(); } catch(Exception e) {}
		}
		return instanceUser;
	}
	
}
