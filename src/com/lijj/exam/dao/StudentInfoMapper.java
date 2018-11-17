package com.lijj.exam.dao;

import java.util.List;

import com.lijj.exam.pojo.StudentInfo;

public interface StudentInfoMapper {

	List<StudentInfo> getStudent(String studentAccount);

	int studentRegister(StudentInfo studentInfo);

	StudentInfo getStudentById(Integer studentId);

	int resetStudentPwd(StudentInfo studnet);

	int getStudentTotal();

}
