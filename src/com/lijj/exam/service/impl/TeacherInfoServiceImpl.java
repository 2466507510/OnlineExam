package com.lijj.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijj.exam.dao.TeacherInfoMapper;
import com.lijj.exam.pojo.TeacherInfo;
import com.lijj.exam.service.TeacherInfoService;

@Service
public class TeacherInfoServiceImpl implements TeacherInfoService {

	@Autowired
	private TeacherInfoMapper teacherInfoMapper;

	@Override
	public TeacherInfo getTeacher(String teacherAccount) {
		// TODO Auto-generated method stub
		return teacherInfoMapper.getTeacher(teacherAccount);
	}

	@Override
	public int getTeacherTotal() {
		// TODO Auto-generated method stub
		return teacherInfoMapper.getTeacherTotal();
	}

	@Override
	public List<TeacherInfo> getTeachersByWork() {
		// TODO Auto-generated method stub
		return teacherInfoMapper.getTeachersByWork();
	}

	@Override
	public List<TeacherInfo> getAllTeachers() {
		// TODO Auto-generated method stub
		return teacherInfoMapper.getAllTeachers();
	}

}
