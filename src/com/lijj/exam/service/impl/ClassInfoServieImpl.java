package com.lijj.exam.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lijj.exam.dao.ClassInfoMapper;
import com.lijj.exam.dao.TeacherInfoMapper;
import com.lijj.exam.pojo.ClassInfo;
import com.lijj.exam.pojo.TeacherInfo;
import com.lijj.exam.service.ClassInfoService;

@Service
public class ClassInfoServieImpl implements ClassInfoService {

	@Autowired
	private ClassInfoMapper classInfoMapper;
	@Autowired
	private TeacherInfoMapper teacherInfoMapper;

	@Override
	public List<ClassInfo> getStudentRegisterClassSelect() {
		// TODO Auto-generated method stub
		return classInfoMapper.getStudentRegisterClassSelect();
	}

	@Override
	public List<ClassInfo> getClassesByGradeId(Integer gradeId) {
		// TODO Auto-generated method stub
		return classInfoMapper.getClassesByGradeId(gradeId);
	}

	@Override
	public List<ClassInfo> getAllClasses() {
		// TODO Auto-generated method stub
		return classInfoMapper.getAllClasses();
	}

	@Transactional
	@Override
	public int addClassAndUpdateTeacherIsWork(ClassInfo _class) {
		// TODO Auto-generated method stub
		int row1 = classInfoMapper.addClass(_class);
		TeacherInfo teacher = _class.getTeacherInfo();
		int row2 = teacherInfoMapper.updateTeacherWorkById(teacher);
		System.out.println(_class.getTeacherInfo().getIsWork());
		return row1 + row2;
	}

	@Transactional
	@Override
	public int updateClass(Map<String, Object> map) {
		// TODO Auto-generated method stub
		// 更新班级信息
		int row1 = classInfoMapper.updateClass(map);
		// 修改当前所选教师的isWork=1
		TeacherInfo teacher = new TeacherInfo();
		teacher.setTeacherId((Integer) map.get("teacherId"));
		teacher.setIsWork(1);
		int row2 = teacherInfoMapper.updateTeacherWorkById(teacher);
		// 修改之前教师的isWork=0
		TeacherInfo teacher2 = new TeacherInfo();
		teacher2.setTeacherId((Integer) map.get("oldTeacherId"));
		teacher2.setIsWork(0);
		int row3 = teacherInfoMapper.updateTeacherWorkById(teacher2);
		return row1 + row2 + row3;
	}

	@Transactional
	@Override
	public int deleteClassAndUpdateTeacherIsWork(Integer classId, Integer oldTeacherId) {
		// TODO Auto-generated method stub
		int row1 = classInfoMapper.deleteClass(classId);
		TeacherInfo teacher = new TeacherInfo();
		teacher.setTeacherId(oldTeacherId);
		teacher.setIsWork(0);
		int row2 = teacherInfoMapper.updateTeacherWorkById(teacher);
		return row1 + row2;
	}

	@Override
	public Map<String, Object> getStudentCountByClass(Integer gradeId) {
		// TODO Auto-generated method stub
		return classInfoMapper.getStudentCountByClass(gradeId);
	}

	@Override
	public List<ClassInfo> getClassByClassId(Integer classId) {
		// TODO Auto-generated method stub
		return classInfoMapper.getClassByClassId(classId);
	}

}
