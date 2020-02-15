package com.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.connectdb.ConnectSchoolManager;

public class User implements UserAuthenticator {
	protected String id,name,email,phone,address,birthdate,registereddate,userName,password,bio,status,link;
	protected boolean adminCheck;
	
	public User() {
		super();
	}

	public User(String id, String name, String email, String phone, String address, String birthdate, String registereddate, String userName,
			String password, String bio, String status, String link) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.birthdate = birthdate;
		this.registereddate = registereddate;
		this.userName = userName;
		this.password = password;
		this.bio = bio;
		this.status = status;
		this.link = link;
	}
	
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRegistereddate() {
		return registereddate;
	}

	public void setRegistereddate(String registereddate) {
		this.registereddate = registereddate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public void setAdmin() {
		this.adminCheck = true;
	}
	
	public boolean getAdmin() {
		return adminCheck;
	}
	
	@Override
	public boolean authenticateUser(String username,String password,String usertype) {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// Establish the connection.
			con = ConnectSchoolManager.doConnect();
			
			// Create statement to get login credentials from DB.
			stmt = con.createStatement();
			
			try {
				String dbusername = null;
				String dbpassword = null;
				
				if(usertype.equals("Student")) {
					// Create and execute SQL statement.
					String checkStudentQuery = "SELECT studentID,password FROM Student WHERE StudentID = '"+username+"';" ;
					rs = stmt.executeQuery(checkStudentQuery);
					
					while(rs.next()) {
						dbusername = rs.getString(1);
						dbpassword = rs.getString(2);
						System.out.println(dbusername+" "+dbpassword);
					}
					
					if(dbusername.equals(username) && dbpassword.equals(password))
						return true;
					else
						return false;
				}
				else if(usertype.equals("AcademicStaff")) {
					String checkAcademicStaffQuery = "SELECT staffID,password FROM AcademicStaff WHERE staffID = '"+username+"';" ;
					rs = stmt.executeQuery(checkAcademicStaffQuery);
					
					while(rs.next()) {
						dbusername = rs.getString(1);
						dbpassword = rs.getString(2);
					}
					
					if(dbusername.equals(username) && dbpassword.equals(password))
						return true;
					else
						return false;
				}
				else if(usertype.equals("NonAcademicStaff")) {
					String checkNonAcademicStaffQuery = "SELECT staffID,password,priorityLevel FROM NonAcademicStaff WHERE staffID = '"+username+"';" ;
					rs = stmt.executeQuery(checkNonAcademicStaffQuery);
					String dbprioritylevel = null;
					
					while(rs.next()) {
						dbusername = rs.getString(1);
						dbpassword = rs.getString(2);
						dbprioritylevel = rs.getString(3);
						if(dbprioritylevel.equals("Admin")) {
							this.setAdmin();
						}
					}
					if(dbusername.equals(username) && dbpassword.equals(password))
						return true;
					else
						return false;
				}
				else
					return false; 
			}
			catch(SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(stmt != null) try { stmt.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return false;
	}
	
}