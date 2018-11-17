package com.lijj.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.lijj.exam.dao.GradeInfoMapper;
import com.lijj.exam.pojo.GradeInfo;
import com.lijj.exam.service.GradeInfoService;

@Service
public class GradeInfoServieImpl implements GradeInfoService {

	@Autowired
	private GradeInfoMapper gradeInfoMapper;

	@Override
	public List<GradeInfo> getAllGrades() {
		// TODO Auto-generated method stub
		return gradeInfoMapper.getAllGrades();
	}

	@Override
	public int addGrade(String gradeName) {
		// TODO Auto-generated method stub
		return gradeInfoMapper.addGrade(gradeName);
	}

	@Override
	public int deleteGrade(Integer gradeId) {
		// TODO Auto-generated method stub
		int row = 0;
		try {
			row = gradeInfoMapper.deleteGrade(gradeId);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

	@Override
	public int updateGrade(GradeInfo grade) {
		// TODO Auto-generated method stub
		return gradeInfoMapper.updateGrade(grade);
	}

}
