package com.user;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.connectdb.ConnectSchoolManager;

public class AcademicDao {
	
	public static List<Academic> getRecords() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Academic> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			ps = con.prepareStatement("SELECT * FROM AcademicStaff;");
			rs = ps.executeQuery();
			
			while(rs.next()) {	
				Academic a = new Academic();
				
				a.setId(rs.getString(1));
				a.setUserName(rs.getString(2));
				a.setDesignation(rs.getString(3));
				a.setName(rs.getString(4));
				a.setBirthdate(rs.getString(5));
				a.setRegistereddate(rs.getString(6));
				a.setPhone(rs.getString(7));
				a.setAddress(rs.getString(8));
				a.setQualification(rs.getString(9));
				a.setSalary(rs.getString(10));
				a.setBio(rs.getString(11));
				a.setEmail(rs.getString(12));
				a.setPassword(rs.getString(13));
				a.setStatus(rs.getString(14));
				
				list.add(a);
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
	
	public static String getNewAcademicID() {
		String newacademicID = null;
		
		Connection con = null;
		CallableStatement cstmt = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			cstmt = con.prepareCall("{? = call dbo.getNewID(?)}");
			
			cstmt.registerOutParameter(1, Types.VARCHAR);
			cstmt.setString(2, "AcademicStaff");
			
			cstmt.execute();
			
			newacademicID = cstmt.getString(1); 
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(cstmt != null) try { cstmt.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		
		return newacademicID;
	}

	public static boolean addNewAcademic(Academic newAcademic) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String addnewAcademicquery = "INSERT INTO AcademicStaff(staffID,staffName,birthdate,phone,address,salary,email) VALUES(?,?,?,?,?,?,?);" ;
			
			ps = con.prepareStatement(addnewAcademicquery);
			
			ps.setString(1,newAcademic.getId());
			ps.setString(2,newAcademic.getName());
			ps.setString(3,newAcademic.getBirthdate());
			ps.setString(4,newAcademic.getPhone());
			ps.setString(5,newAcademic.getAddress());
			ps.setString(6,newAcademic.getSalary());
			ps.setString(7,newAcademic.getEmail());
			
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

	public static boolean updateAcademic(Academic tobeupdated) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();	
			String sqlupdateAcademic = "UPDATE AcademicStaff SET staffName = ?,birthdate = ?,phone = ?,address = ?,salary = ?,email = ? WHERE staffID = ?" ;
			
			ps = con.prepareStatement(sqlupdateAcademic);
			
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

	public static boolean removeAcademic(String acid) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String academicremovequery = "UPDATE AcademicStaff SET status = ? WHERE staffID = ?;" ;
			ps = con.prepareStatement(academicremovequery);
			ps.setInt(1, 0);
			ps.setString(2, acid);
			
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

	public static boolean editProfile(Academic acprofile) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String editprofilequery = "UPDATE AcademicStaff SET userName = ?,designation = ?,"
									+ "phone = ?,address = ?,qualification = ?,bio = ?,email = ?,"
									+ "password = ?,link = ? WHERE staffID = ?;" ;
			ps = con.prepareStatement(editprofilequery);
			ps.setString(1, acprofile.getUserName());
			ps.setString(2, acprofile.getDesignation());
			ps.setString(3, acprofile.getPhone());
			ps.setString(4, acprofile.getAddress());
			ps.setString(5, acprofile.getQualification());
			ps.setString(6, acprofile.getBio());
			ps.setString(7, acprofile.getEmail());
			ps.setString(8, acprofile.getPassword());
			ps.setString(9, acprofile.getLink());
			ps.setString(10, acprofile.getId());
			
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
