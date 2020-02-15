package com.sport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connectdb.ConnectSchoolManager;

public class SportDao {
	public static List<Sport> getRecords() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Sport> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			ps = con.prepareStatement("SELECT sp.sportID,sp.sportName,sp.coachPerson,nacs.staffName "
									+ "FROM Sport sp,NonAcademicStaff nacs "
									+ "WHERE sp.coachPerson = nacs.staffID");
			rs = ps.executeQuery();
			
			while(rs.next()) {	
				Sport sp = new Sport();

				sp.setSportID(rs.getString(1));
				sp.setSportName(rs.getString(2));
				sp.setCoachPersonID(rs.getString(3));
				sp.setCoachPersonName(rs.getString(4));
				
				list.add(sp);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(con != null) try { con.close(); } catch(Exception e) {}
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(rs != null) try { rs.close(); } catch(Exception e) {}
		}
		return list;
	}
	
	public static List<Sport> getRecordsforCoach(String nonacademicid) {
		
		List<Sport> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String getsportsforcoachquery = "SELECT Sp.sportID,Sp.sportName,Sp.coachPerson "
										  + "FROM Sport Sp "
										  + "WHERE Sp.coachPerson = ?;" ; 
			ps = con.prepareStatement(getsportsforcoachquery);
			ps.setString(1, nonacademicid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Sport sp = new Sport();
				
				sp.setSportID(rs.getString(1));
				sp.setSportName(rs.getString(2));
				sp.setCoachPersonID(rs.getString(3));
				
				list.add(sp);
			}
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		
		return list;
	}
	
	public static List<Practise> getPractiseList(String sportname) {
		
		List<Practise> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String getsportspractisequery = "SELECT St.studentID,St.studentName,P.startedDate "
										+ "FROM Practise P,Student St "
										+ "WHERE P.sportID = (SELECT sportID FROM Sport WHERE sportName = ?) "
										+ "AND "
										+ "P.studentID = St.studentID;" ;
			ps = con.prepareStatement(getsportspractisequery);
			ps.setString(1, sportname);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Practise pr = new Practise();
				
				pr.setStudentID(rs.getString(1));
				pr.setStudentName(rs.getString(2));
				pr.setStartedDate(rs.getString(3));
				
				list.add(pr);
			}
		}
		catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		
		return list;
	}
}
