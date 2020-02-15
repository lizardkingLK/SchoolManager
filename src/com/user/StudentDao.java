package com.user;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.connectdb.ConnectSchoolManager;

public class StudentDao {

	public static List<Student> getRecords() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Student> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			ps = con.prepareStatement("SELECT * FROM Student;");
			rs = ps.executeQuery();
			
			while(rs.next()) {	
				Student s = new Student();
				
				s.setId(rs.getString(1));
				s.setUserName(rs.getString(2));
				s.setName(rs.getString(3));
				s.setEnteredGrade(rs.getString(4));
				s.setBirthdate(rs.getString(5));
				s.setRegistereddate(rs.getString(6));
				s.setPhone(rs.getString(7));
				s.setAddress(rs.getString(8));
				s.setBio(rs.getString(9));
				s.setEmail(rs.getString(10));
				s.setPassword(rs.getString(11));
				s.setStatus(rs.getString(12));
				s.setCurrentGrade(rs.getString(13));
				
				list.add(s);
			}
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(ps != null) try { rs.close(); } catch(Exception e) {}
			if(con != null) try { rs.close(); } catch(Exception e) {}
		}
		return list;
	}
	
	public static String getNewStudentID() {
		String newstudentID = null;
		
		Connection con = null;
		CallableStatement cstmt = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			cstmt = con.prepareCall("{? = call dbo.getNewID(?)}");
			
			cstmt.registerOutParameter(1, Types.VARCHAR);
			cstmt.setString(2, "Student");
			
			cstmt.execute();
			
			newstudentID = cstmt.getString(1); 
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(cstmt != null) try { cstmt.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		
		return newstudentID;
	}
	
	public static boolean addNewStudent(Student newStudent) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String addnewStudentquery = "INSERT INTO Student(studentID,studentName,enteredGrade,birthdate,phone,address) VALUES(?,?,?,?,?,?);" ;
			
			ps = con.prepareStatement(addnewStudentquery);
			
			ps.setString(1,newStudent.getId());
			ps.setString(2,newStudent.getName());
			ps.setString(3,newStudent.getEnteredGrade());
			ps.setString(4,newStudent.getBirthdate());
			ps.setString(5,newStudent.getPhone());
			ps.setString(6,newStudent.getAddress());
			
			int count = ps.executeUpdate();
			if(count > 0)
				return true;
			else
				return false;
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return false;
	
	}
	
	public static Student getStudent(String studentId) {
		Student s = new Student();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String getStudentQuery = "SELECT * FROM Student WHERE studentID = '"+studentId+"';" ;
			stmt = con.createStatement();
			rs = stmt.executeQuery(getStudentQuery);
			
			while(rs.next()) {
				s.setId(rs.getString(1));
				s.setUserName(rs.getString(2));
				s.setName(rs.getString(3));
				s.setEnteredGrade(rs.getString(4));
				s.setBirthdate(rs.getString(5));
				s.setRegistereddate(rs.getString(6));
				s.setPhone(rs.getString(7));
				s.setAddress(rs.getString(8));
				s.setBio(rs.getString(9));
				s.setEmail(rs.getString(10));
				s.setPassword(rs.getString(11));
				s.setStatus(rs.getString(12));
				s.setCurrentGrade(rs.getString(13));
			}
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(stmt != null) try { stmt.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return s;
	}
	
	public static boolean updateStudent(Student tobeupdated) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();		
			String sqlupdateStudent = "UPDATE Student SET studentName = ?,currentGrade = ?,birthdate = ?,phone = ?,address = ? WHERE studentID = ?;" ;
			
			ps = con.prepareStatement(sqlupdateStudent);
			
			ps.setString(1, tobeupdated.getName());
			ps.setString(2, tobeupdated.getCurrentGrade());
			ps.setString(3, tobeupdated.getBirthdate());
			ps.setString(4, tobeupdated.getPhone());
			ps.setString(5, tobeupdated.getAddress());
			ps.setString(6, tobeupdated.getId());
			
			int count = ps.executeUpdate();
			if(count > 0)
				return true;
			else
				return false;
		} 
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return false;
	}
	
	public static boolean removeStudent(String stuid) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String studentremovequery = "UPDATE Student SET status = ? WHERE studentID = ?;" ;
			ps = con.prepareStatement(studentremovequery);
			ps.setInt(1, 0);
			ps.setString(2, stuid);
			
			int count = ps.executeUpdate();
			if(count > 0)
				return true;
			else
				return false;
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return false;
	}

	public static boolean editProfile(Student studprofile) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String editprofilequery = "UPDATE Student SET userName = ?,"
									+ "phone = ?,address = ?,bio = ?,email = ?,"
									+ "password = ?,link = ? WHERE studentID = ?;" ;
			ps = con.prepareStatement(editprofilequery);
			ps.setString(1, studprofile.getUserName());
			ps.setString(2, studprofile.getPhone());
			ps.setString(3, studprofile.getAddress());
			ps.setString(4, studprofile.getBio());
			ps.setString(5, studprofile.getEmail());
			ps.setString(6, studprofile.getPassword());
			ps.setString(7, studprofile.getLink());
			ps.setString(8, studprofile.getId());
			
			int count = ps.executeUpdate();
			if(count > 0)
				return true;
			else
				return false;
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		
		return false;
	} 
}
