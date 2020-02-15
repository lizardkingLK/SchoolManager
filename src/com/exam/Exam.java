package com.exam;

public class Exam {
	private String examID,examDescription,subject,term;
	
	public Exam() {
		super();
	}

	public Exam(String examID, String examDescription, String subject, String term) {
		super();
		this.examID = examID;
		this.examDescription = examDescription;
		this.subject = subject;
		this.term = term;
	}

	public String getExamID() {
		return examID;
	}

	public void setExamID(String examID) {
		this.examID = examID;
	}

	public String getExamDescription() {
		return examDescription;
	}

	public void setExamDescription(String examDescription) {
		this.examDescription = examDescription;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}
	
}
