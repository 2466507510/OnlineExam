package com.lijj.exam.dao;

import java.util.List;

import com.lijj.exam.pojo.CourseInfo;

public interface CourseInfoMapper {

	List<CourseInfo> getAllCourses();

	int addCourse(CourseInfo course);

	int updateCourse(CourseInfo course);

	int deleteCourse(Integer courseId);

}
