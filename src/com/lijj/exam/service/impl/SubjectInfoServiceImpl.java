package com.lijj.exam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijj.exam.dao.SubjectInfoMapper;
import com.lijj.exam.service.SubjectInfoService;

@Service
public class SubjectInfoServiceImpl implements SubjectInfoService {

	@Autowired
	private SubjectInfoMapper subjectInfoMapper;

	@Override
	public int getSubjectTotal() {
		// TODO Auto-generated method stub
		return subjectInfoMapper.getSubjectTotal();
	}

}
