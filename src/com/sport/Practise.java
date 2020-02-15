package com.sport;

public class Practise {
	String studentID,sportID,startedDate,studentName,coachID,coachName;

	public Practise() {
		super();
	}

	public Practise(String studentID, String sportID, String startedDate, String studentName, String coachID,
			String coachName) {
		super();
		this.studentID = studentID;
		this.sportID = sportID;
		this.startedDate = startedDate;
		this.studentName = studentName;
		this.coachID = coachID;
		this.coachName = coachName;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getSportID() {
		return sportID;
	}

	public void setSportID(String sportID) {
		this.sportID = sportID;
	}

	public String getStartedDate() {
		return startedDate;
	}

	public void setStartedDate(String startedDate) {
		this.startedDate = startedDate;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getCoachID() {
		return coachID;
	}

	public void setCoachID(String coachID) {
		this.coachID = coachID;
	}

	public String getCoachName() {
		return coachName;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}
	
	
}
