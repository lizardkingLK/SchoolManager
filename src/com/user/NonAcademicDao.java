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

public class NonAcademicDao {
	
	public static List<NonAcademic> getRecords() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<NonAcademic> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			ps = con.prepareStatement("SELECT * FROM NonAcademicStaff;");
			rs = ps.executeQuery();
			
			while(rs.next()) {	
				NonAcademic na = new NonAcademic();
				
				na.setId(rs.getString(1));
				na.setUserName(rs.getString(2));
				na.setDesignation(rs.getString(3));
				na.setName(rs.getString(4));
				na.setPriorityLevel(rs.getString(5));
				na.setBirthdate(rs.getString(6));
				na.setRegistereddate(rs.getString(7));
				na.setPhone(rs.getString(8));
				na.setAddress(rs.getString(9));
				na.setQualification(rs.getString(10));
				na.setSalary(rs.getString(11));
				na.setBio(rs.getString(12));
				na.setEmail(rs.getString(13));
				na.setPassword(rs.getString(14));
				na.setStatus(rs.getString(15));
				
				list.add(na);
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
	
	public static String getNewNonAcademicID() {
		String newnonacademicID = null;
		
		Connection con = null;
		CallableStatement cstmt = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			cstmt = con.prepareCall("{? = call dbo.getNewID(?)}");
			
			cstmt.registerOutParameter(1, Types.VARCHAR);
			cstmt.setString(2, "NonAcademicStaff");
			
			cstmt.execute();
			
			newnonacademicID = cstmt.getString(1); 
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(cstmt != null) try { cstmt.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		
		return newnonacademicID;
	}

	public static boolean addNewNonAcademic(NonAcademic newNonAcademic) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String addnewNonAcademicquery = "INSERT INTO NonAcademicStaff(staffID,staffName,birthdate,phone,address,salary,email) VALUES(?,?,?,?,?,?,?);" ;
			
			ps = con.prepareStatement(addnewNonAcademicquery);
			
			ps.setString(1,newNonAcademic.getId());
			ps.setString(2,newNonAcademic.getName());
			ps.setString(3,newNonAcademic.getBirthdate());
			ps.setString(4,newNonAcademic.getPhone());
			ps.setString(5,newNonAcademic.getAddress());
			ps.setString(6,newNonAcademic.getSalary());
			ps.setString(7,newNonAcademic.getEmail());
			
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

	public static boolean updateNonAcademic(NonAcademic tobeupdated) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();	
			String sqlupdateNonAcademic = "UPDATE NonAcademicStaff SET staffName = ?,birthdate = ?,phone = ?,address = ?,salary = ?,email = ? WHERE staffID = ?" ;
			
			ps = con.prepareStatement(sqlupdateNonAcademic);
			
			ps.setString(1, tobeupdated.getName());
			ps.setString(2, tobeupdated.getBirthdate());
			ps.setString(3, tobeupdated.getPhone());
			ps.setString(4, tobeupdated.getAddress());
			ps.setString(5, tobeupdated.getSalary());
			ps.setString(6, tobeupdated.getEmail());
			ps.setString(7, tobeupdated.getId());
			
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

	public static boolean removeNonAcademic(String nonacid) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String removenonacademicquery = "UPDATE NonAcademicStaff SET status = ? WHERE staffID = ?;" ;
			ps = con.prepareStatement(removenonacademicquery);
			ps.setInt(1, 0);
			ps.setString(2, nonacid);
			
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

	public static boolean editProfile(NonAcademic nonacprofile) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String editprofilequery = "UPDATE NonAcademicStaff SET userName = ?,designation = ?,"
									+ "phone = ?,address = ?,qualification = ?,bio = ?,email = ?,"
									+ "password = ?,link = ? WHERE staffID = ?;" ;
			ps = con.prepareStatement(editprofilequery);
			ps.setString(1, nonacprofile.getUserName());
			ps.setString(2, nonacprofile.getDesignation());
			ps.setString(3, nonacprofile.getPhone());
			ps.setString(4, nonacprofile.getAddress());
			ps.setString(5, nonacprofile.getQualification());
			ps.setString(6, nonacprofile.getBio());
			ps.setString(7, nonacprofile.getEmail());
			ps.setString(8, nonacprofile.getPassword());
			ps.setString(9, nonacprofile.getLink());
			ps.setString(10, nonacprofile.getId());
			
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
	
	public static String checkAdmin(String nonacid) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String type = "";
		
		try {
			con = ConnectSchoolManager.doConnect();
			String checkadminquery = "SELECT priorityLevel FROM NonAcademicStaff WHERE staffID = '"+nonacid+"' ;" ;
			stmt = con.createStatement();
			rs = stmt.executeQuery(checkadminquery);
			
			while(rs.next()) {
				if(rs.getString(1).equals("Admin")) {
					type = "Admin";
					return type;
				}
				else {
					type = "Regular";
					return type;
				}
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
		return "undefined";
	}
}
