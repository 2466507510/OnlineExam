package com.lijj.exam.dao;

import java.util.List;

import com.lijj.exam.pojo.TeacherInfo;

public interface TeacherInfoMapper {

	TeacherInfo getTeacher(String teacherAccount);

	int getTeacherTotal();

	List<TeacherInfo> getTeachersByWork();

	int updateTeacherWorkById(TeacherInfo teacher);

	List<TeacherInfo> getAllTeachers();

}
