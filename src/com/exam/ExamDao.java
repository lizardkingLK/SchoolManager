package com.exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connectdb.ConnectSchoolManager;

public class ExamDao {
	public static List<Exam> getRecords() {
		List<Exam> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectSchoolManager.doConnect();
			String getexamquery = "SELECT * FROM Exam" ;
			ps = con.prepareStatement(getexamquery);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Exam e = new Exam();
				
				e.setExamID(rs.getString(1));
				e.setExamDescription(rs.getString(2));
				e.setSubject(rs.getString(3));
				e.setTerm(rs.getString(4));
				
				list.add(e);
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
