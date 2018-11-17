package com.lijj.exam.service;

import java.util.List;

import com.lijj.exam.pojo.StudentInfo;

public interface StudentInfoService {

	List<StudentInfo> getStudent(String studentAccount);

	int studentRegister(StudentInfo student);

	StudentInfo getStudentById(Integer studentId);

	int resetStudentPwd(StudentInfo student);

	int getStudentTotal();

}
