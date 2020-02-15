package com.subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connectdb.ConnectSchoolManager;

public class SubjectDao {
	
	public static List<Subject> getRecords() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Subject> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			
			ps = con.prepareStatement("SELECT s.subjectID,s.subjectName,s.medium,s.grade,s.teacher,acs.staffName "
									+ "FROM Subject s,AcademicStaff acs "
									+ "WHERE s.teacher = acs.staffID ;") ;
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Subject su = new Subject();
				
				su.setSubjectID(rs.getString(1));
				su.setSubjectName(rs.getString(2));
				su.setMedium(rs.getString(3));
				su.setGrade(rs.getString(4));
				su.setTeacherID(rs.getString(5));
				su.setTeacherName(rs.getString(6));
				
				list.add(su);
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
	
	public static List<Subject> getRecordsforStudent(String studentID) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Subject> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			
			ps = con.prepareStatement("SELECT StuSu.subjectID,Su.subjectName,Su.medium,ac.staffID,ac.staffName " 
									+ "FROM StudentHasSubject StuSu,Subject Su,AcademicStaff ac,Student Stu " 
									+ "WHERE StuSu.studentID = ? AND "
									+ "StuSu.subjectID = Su.subjectID AND "
									+ "Su.teacher = ac.staffID AND Stu.currentGrade = Su.grade AND "
									+ "Stu.studentID = StuSu.studentID;") ;
			ps.setString(1, studentID);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Subject su = new Subject();
				
				su.setSubjectID(rs.getString(1));
				su.setSubjectName(rs.getString(2));
				su.setMedium(rs.getString(3));
				su.setTeacherID(rs.getString(4));
				su.setTeacherName(rs.getString(5));
				
				list.add(su);
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
	
	public static boolean assignTeachers(Subject su) {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sid = su.getSubjectID();
		String tid = su.getTeacherID();
		
		try {
			con = ConnectSchoolManager.doConnect();
			String updateSubject = "UPDATE Subject SET teacher = ? WHERE subjectID = ?" ;
			
			ps = con.prepareStatement(updateSubject);
			
			ps.setString(1, tid);
			ps.setString(2, sid);
			
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
	
	public static List<StudentSubject> getStudentSubjects() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<StudentSubject> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			
			ps = con.prepareStatement("SELECT Stsu.studentID,St.studentName,Stsu.subjectID,Su.subjectName,Su.grade,Su.medium "
									+ "FROM StudentHasSubject Stsu,Student St,Subject Su "
									+ "WHERE Stsu.studentID =  St.studentID and Stsu.subjectID = Su.subjectID;") ;
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StudentSubject stusu = new StudentSubject();
				
				stusu.setStudentID(rs.getString(1));
				stusu.setStudentName(rs.getString(2));
				stusu.setSubjectID(rs.getString(3));
				stusu.setSubjectName(rs.getString(4));
				stusu.setGrade(rs.getString(5));
				stusu.setMedium(rs.getString(6));
				
				list.add(stusu);
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
	
	public static List<Subject> getAcademicSubjects(String academicid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Subject> list = new ArrayList<>();
		
		try {
			con = ConnectSchoolManager.doConnect();
			
			ps = con.prepareStatement("SELECT Su.subjectID,Su.subjectName,Su.medium,Su.grade "
									+ "FROM Subject Su "
									+ "WHERE Su.teacher = ?;") ;
			ps.setString(1, academicid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Subject su = new Subject();
				
				su.setSubjectID(rs.getString(1));
				su.setSubjectName(rs.getString(2));
				su.setMedium(rs.getString(3));
				su.setGrade(rs.getString(4));
				
				list.add(su);
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

