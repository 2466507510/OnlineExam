package com.lijj.exam.dao;

import java.util.List;

import com.lijj.exam.pojo.GradeInfo;

public interface GradeInfoMapper {

	List<GradeInfo> getAllGrades();

	int addGrade(String gradeName);

	int deleteGrade(Integer gradeId);

	int updateGrade(GradeInfo grade);

}
