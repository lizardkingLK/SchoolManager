package com.result;

public class Result {
	private String resultID,resultDescription,studentID,examID,subjectID,medium,term,studentName,grade,subjectName;

	public Result() {
		super();
	}

	public Result(String resultID, String resultDescription, String studentID, String examID, String subject, String term, String medium, String studentName, String grade, String subjectName) {
		super();
		this.resultID = resultID;
		this.resultDescription = resultDescription;
		this.studentID = studentID;
		this.examID = examID;
		this.term = term;
		this.medium = medium;
		this.studentName = studentName;
		this.grade = grade;
		this.subjectName = subjectName;
	}

	public String getResultID() {
		return resultID;
	}

	public void setResultID(String resultID) {
		this.resultID = resultID;
	}

	public String getResultDescription() {
		return resultDescription;
	}

	public void setResultDescription(String resultDescription) {
		this.resultDescription = resultDescription;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getExamID() {
		return examID;
	}

	public void setExamID(String examID) {
		this.examID = examID;
	}

	public String getSubjectID() {
		return subjectID;
	}

	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
	}

	public String getMedium() {
		return medium;
	}

	public void setMedium(String medium) {
		this.medium = medium;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
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
	
	
}
