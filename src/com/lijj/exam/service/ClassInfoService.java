package com.lijj.exam.service;

import java.util.List;
import java.util.Map;

import com.lijj.exam.pojo.ClassInfo;

public interface ClassInfoService {

	List<ClassInfo> getStudentRegisterClassSelect();

	List<ClassInfo> getClassesByGradeId(Integer gradeId);

	List<ClassInfo> getAllClasses();

	int addClassAndUpdateTeacherIsWork(ClassInfo _class);

	int updateClass(Map<String, Object> map);

	int deleteClassAndUpdateTeacherIsWork(Integer classId, Integer oldTeacherId);

	Map<String, Object> getStudentCountByClass(Integer gradeId);

	List<ClassInfo> getClassByClassId(Integer classId);

}
