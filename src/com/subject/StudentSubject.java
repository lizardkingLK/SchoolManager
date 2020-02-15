package com.subject;

public class StudentSubject {
	private String studentID,studentName,subjectID,grade,subjectName,medium;

	public StudentSubject() {
		super();
	}

	public StudentSubject(String studentID, String studentName, String subjectID, String grade, String subjectName,
			String medium) {
		super();
		this.studentID = studentID;
		this.studentName = studentName;
		this.subjectID = subjectID;
		this.grade = grade;
		this.subjectName = subjectName;
		this.medium = medium;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getSubjectID() {
		return subjectID;
	}

	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getMedium() {
		return medium;
	}

	public void setMedium(String medium) {
		this.medium = medium;
	}
	
	
}
