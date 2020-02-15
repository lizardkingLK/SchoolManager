package com.result;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connectdb.ConnectSchoolManager;

public class ResultDao {
	
	public static List<Result> getResults(String studentID) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Result> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			
			ps = con.prepareStatement("SELECT Su.subjectName,Su.medium,E.term,R.resultDescription "
									+ "FROM Subject Su, result R,Exam E "
									+ "WHERE R.studentID = ? AND "
									+ "R.subject = Su.subjectID AND "
									+ "R.examID = E.examID") ;
			ps.setString(1, studentID);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Result r = new Result();
				
				r.setSubjectID(rs.getString(1));
				r.setMedium(rs.getString(2));
				r.setTerm(rs.getString(3));
				r.setResultDescription(rs.getString(4));
				
				list.add(r);
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
	
	public static List<Result> getResultsByTeacher(String subjectID) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Result> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			
			ps = con.prepareStatement("SELECT R.resultID,R.studentID,St.studentName,Su.grade,Su.subjectName,Su.medium,E.term,R.resultDescription "
									+ "FROM Result R,Student St,Subject Su,Exam E "
									+ "WHERE R.subject = ? AND "
									+ "R.studentID = St.studentID AND "
									+ "R.subject = Su.subjectID "
									+ "AND E.examID = R.examID") ;
			ps.setString(1, subjectID);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Result r = new Result();
				
				r.setResultID(rs.getString(1));
				r.setStudentID(rs.getString(2));
				r.setStudentName(rs.getString(3));
				r.setGrade(rs.getString(4));
				r.setSubjectName(rs.getString(5));
				r.setMedium(rs.getString(6));
				r.setTerm(rs.getString(7));
				r.setResultDescription(rs.getString(8));
				
				list.add(r);
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
