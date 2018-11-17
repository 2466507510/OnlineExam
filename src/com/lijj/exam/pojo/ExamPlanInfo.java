package com.lijj.exam.pojo;


public class ExamPlanInfo {

	private Integer examPlanId;
	private String beginTime;
	private CourseInfo courseInfo;
	private ClassInfo classInfo;
	private ExamPaperInfo examPaperInfo;
	public Integer getExamPlanId() {
		return examPlanId;
	}
	public void setExamPlanId(Integer examPlanId) {
		this.examPlanId = examPlanId;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public CourseInfo getCourseInfo() {
		return courseInfo;
	}
	public void setCourseInfo(CourseInfo courseInfo) {
		this.courseInfo = courseInfo;
	}
	public ClassInfo getClassInfo() {
		return classInfo;
	}
	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}
	public ExamPaperInfo getExamPaperInfo() {
		return examPaperInfo;
	}
	public void setExamPaperInfo(ExamPaperInfo examPaperInfo) {
		this.examPaperInfo = examPaperInfo;
	}
}
