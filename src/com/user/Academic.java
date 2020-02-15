package com.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.connectdb.ConnectSchoolManager;

public class Academic extends User {
	private String qualification,salary,designation;
	
	public Academic() {
		super();
	}

	public Academic(String id, String name, String email, String phone, String address, String birthdate,
		String registereddate, String userName, String designation, String password, String bio, String status, String qualification, String salary, String link) {
		super(id, name, email, phone, address, birthdate, registereddate, userName, password, bio, status, link);
		this.setQualification(qualification);
		this.setSalary(salary);
		this.setDesignation(designation);
	}
	
	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public Academic loadAndSetInstance(String userID) {
		Academic instanceUser = new Academic();
		
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
				String staffID = null;
				String userName = null;
				String designation = null;
				String staffName = null;
				String birthdate = null;
				String registeredDate = null;
				String phone = null;
				String address = null;
				String qualification = null;
				String salary = null;
				String bio = null;
				String email = null;
				String password = null;
				String status = null;
				String link = null;
				
				// Create and execute SQL statement.
				String getInstanceQuery = "SELECT * FROM AcademicStaff WHERE staffID = '"+userID+"';" ;
				rs = stmt.executeQuery(getInstanceQuery);
				
				while(rs.next()) {
					staffID = rs.getString(1);	instanceUser.setId(staffID);
					userName = rs.getString(2); instanceUser.setUserName(userName);
					designation = rs.getString(3); instanceUser.setDesignation(designation);
					staffName = rs.getString(4); instanceUser.setName(staffName);
					birthdate = rs.getString(5); instanceUser.setBirthdate(birthdate);
					registeredDate = rs.getString(6); instanceUser.setRegistereddate(registeredDate);
					phone = rs.getString(7); instanceUser.setPhone(phone);
					address = rs.getString(8); instanceUser.setAddress(address);
					qualification = rs.getString(9); instanceUser.setQualification(qualification);
					salary = rs.getString(10); instanceUser.setSalary(salary);
					bio = rs.getString(11); instanceUser.setBio(bio);
					email = rs.getString(12); instanceUser.setEmail(email);
					password = rs.getString(13); instanceUser.setPassword(password);
					status = rs.getString(14); instanceUser.setStatus(status);
					link = rs.getString(15); instanceUser.setLink(link);
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
