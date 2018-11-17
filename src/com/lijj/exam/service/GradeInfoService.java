package com.lijj.exam.service;

import java.util.List;

import com.lijj.exam.pojo.GradeInfo;

public interface GradeInfoService {

	List<GradeInfo> getAllGrades();

	int addGrade(String gradeName);

	int deleteGrade(Integer gradeId);

	int updateGrade(GradeInfo grade);

}
