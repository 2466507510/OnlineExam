package com.lijj.exam.service;

import java.util.List;

import com.lijj.exam.pojo.TeacherInfo;

public interface TeacherInfoService {

	TeacherInfo getTeacher(String teacherAccount);

	int getTeacherTotal();

	List<TeacherInfo> getTeachersByWork();

	List<TeacherInfo> getAllTeachers();

}
