package com.lijj.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijj.exam.dao.StudentInfoMapper;
import com.lijj.exam.pojo.StudentInfo;
import com.lijj.exam.service.StudentInfoService;

@Service
public class StudentInfoServiceImpl implements StudentInfoService {

	@Autowired
	private StudentInfoMapper studentInfoMapper;

	@Override
	public List<StudentInfo> getStudent(String studentAccount) {
		// TODO Auto-generated method stub
		return studentInfoMapper.getStudent(studentAccount);
	}

	@Override
	public int studentRegister(StudentInfo studentInfo) {
		// TODO Auto-generated method stub
		return studentInfoMapper.studentRegister(studentInfo);
	}

	@Override
	public StudentInfo getStudentById(Integer studentId) {
		// TODO Auto-generated method stub
		return studentInfoMapper.getStudentById(studentId);
	}

	@Override
	public int resetStudentPwd(StudentInfo student) {
		// TODO Auto-generated method stub
		return studentInfoMapper.resetStudentPwd(student);
	}

	@Override
	public int getStudentTotal() {
		// TODO Auto-generated method stub
		return studentInfoMapper.getStudentTotal();
	}

}
