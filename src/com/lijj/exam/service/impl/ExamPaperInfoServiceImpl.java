package com.lijj.exam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijj.exam.dao.ExamPaperInfoMapper;
import com.lijj.exam.service.ExamPaperInfoService;

@Service
public class ExamPaperInfoServiceImpl implements ExamPaperInfoService {

	@Autowired
	private ExamPaperInfoMapper examPaperInfoMapper;
	
	@Override
	public int getExamPaperTotal() {
		// TODO Auto-generated method stub
		return examPaperInfoMapper.getExamPaperTotal();
	}

}
