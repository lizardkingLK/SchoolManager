package com.subject;

public class Subject {
	private String subjectID,subjectName,medium,grade,teacherID,teacherName;
	
	// singleton object declaration for subject
	public static Subject subjectSingleton;
	
	public static Subject getSubjectSingleton() {
		if(subjectSingleton == null) {
			subjectSingleton = new Subject();
			return subjectSingleton;
		}
		return subjectSingleton;
	}
	
	public Subject() {
		super();
	}

	public Subject(String subjectID, String subjectName, String medium, String grade, String teacherID, String teacherName) {
		super();
		this.subjectID = subjectID;
		this.subjectName = subjectName;
		this.medium = medium;
		this.grade = grade;
		this.teacherID = teacherID;
		this.teacherName = teacherName;
	}

	public String getSubjectID() {
		return subjectID;
	}

	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	
}
