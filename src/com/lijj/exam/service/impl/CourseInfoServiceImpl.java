package com.lijj.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.lijj.exam.dao.CourseInfoMapper;
import com.lijj.exam.pojo.CourseInfo;
import com.lijj.exam.service.CourseInfoService;

@Service
public class CourseInfoServiceImpl implements CourseInfoService {

	@Autowired
	private CourseInfoMapper courseInfoMapper;

	@Override
	public List<CourseInfo> getAllCourses() {
		// TODO Auto-generated method stub
		return courseInfoMapper.getAllCourses();
	}

	@Override
	public int addCourse(CourseInfo course) {
		// TODO Auto-generated method stub
		return courseInfoMapper.addCourse(course);
	}

	@Override
	public int updateCourse(CourseInfo course) {
		// TODO Auto-generated method stub
		return courseInfoMapper.updateCourse(course);
	}

	@Override
	public int deleteCourse(Integer courseId) {
		// TODO Auto-generated method stub
		int row = 0;
		try {
			row = courseInfoMapper.deleteCourse(courseId);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

}
