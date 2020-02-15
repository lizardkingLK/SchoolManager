package com.sport;

public class Sport {
	private String sportID,sportName,coachPersonID,coachPersonName;

	public Sport() {
		super();
	}
	
	public Sport(String sportID, String sportName, String coachPersonID, String coachPersonName) {
		super();
		this.sportID = sportID;
		this.sportName = sportName;
		this.coachPersonID = coachPersonID;
		this.coachPersonName = coachPersonName;
	}

	public String getSportID() {
		return sportID;
	}

	public void setSportID(String sportID) {
		this.sportID = sportID;
	}

	public String getSportName() {
		return sportName;
	}

	public void setSportName(String sportName) {
		this.sportName = sportName;
	}

	public String getCoachPersonID() {
		return coachPersonID;
	}

	public void setCoachPersonID(String coachPersonID) {
		this.coachPersonID = coachPersonID;
	}

	public String getCoachPersonName() {
		return coachPersonName;
	}

	public void setCoachPersonName(String coachPersonName) {
		this.coachPersonName = coachPersonName;
	}
}
