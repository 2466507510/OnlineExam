package com.lijj.exam.pojo;

public class ExamHistoryInfo {

	private Integer historyId;
	private Integer examScore;
	private StudentInfo studentInfo;
	private ExamPaperInfo examPaperInfo;
	public Integer getHistoryId() {
		return historyId;
	}
	public void setHistoryId(Integer historyId) {
		this.historyId = historyId;
	}
	public Integer getExamScore() {
		return examScore;
	}
	public void setExamScore(Integer examScore) {
		this.examScore = examScore;
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
}
