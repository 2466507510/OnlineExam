package com.lijj.exam.pojo;

public class ExamChooseInfo {

	private Integer chooseId;
	private String chooseResult;
	private StudentInfo studentInfo;
	private ExamPaperInfo examPaperInfo;
	private SubjectInfo info;
	public Integer getChooseId() {
		return chooseId;
	}
	public void setChooseId(Integer chooseId) {
		this.chooseId = chooseId;
	}
	public String getChooseResult() {
		return chooseResult;
	}
	public void setChooseResult(String chooseResult) {
		this.chooseResult = chooseResult;
	}
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	public ExamPaperInfo getExamPaperInfo() {
		return examPaperInfo;
	}
	public void setExamPaperInfo(ExamPaperInfo examPaperInfo) {
		this.examPaperInfo = examPaperInfo;
	}
	public SubjectInfo getInfo() {
		return info;
	}
	public void setInfo(SubjectInfo info) {
		this.info = info;
	}
	
}
