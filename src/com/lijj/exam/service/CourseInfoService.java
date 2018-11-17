package com.lijj.exam.service;

import java.util.List;

import com.lijj.exam.pojo.CourseInfo;

public interface CourseInfoService {

	List<CourseInfo> getAllCourses();

	int addCourse(CourseInfo course);

	int updateCourse(CourseInfo course);

	int deleteCourse(Integer courseId);

}
