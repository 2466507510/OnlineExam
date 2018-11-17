package com.lijj.exam.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
import org.springframework.stereotype.Repository;

import com.lijj.exam.pojo.ClassInfo;

@Repository
public interface ClassInfoMapper {

	List<ClassInfo> getStudentRegisterClassSelect();

	List<ClassInfo> getClassesByGradeId(Integer gradeId);

	List<ClassInfo> getAllClasses();

	int addClass(ClassInfo _class);

	int updateClass(Map<String, Object> map);

	int deleteClass(Integer classId);

	@MapKey("className")
	Map<String, Object> getStudentCountByClass(Integer gradeId);

	List<ClassInfo> getClassByClassId(Integer classId);

}
