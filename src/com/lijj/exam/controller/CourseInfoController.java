package com.lijj.exam.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lijj.exam.pojo.CourseInfo;
import com.lijj.exam.pojo.GradeInfo;
import com.lijj.exam.service.CourseInfoService;
import com.lijj.exam.service.GradeInfoService;

@Controller
public class CourseInfoController {

	@Autowired
	private CourseInfoService courseInfoService;
	@Autowired
	private GradeInfoService gradeInfoService;

	@RequestMapping("getAllCourses")
	public ModelAndView getAllCourses(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		List<CourseInfo> courses = courseInfoService.getAllCourses();
		System.out.println(courses);
		model.setViewName("forward:backstage/courses.jsp");
		model.addObject("courses", courses);
		return model;
	}

	@RequestMapping("preAddCourse")
	public ModelAndView preAddCourse() {
		// 获取下拉列表的所属年级
		ModelAndView model = new ModelAndView();
		List<GradeInfo> grades = gradeInfoService.getAllGrades();
		model.addObject("grades", grades);
		model.setViewName("backstage/addCourse");
		return model;
	}

	@RequestMapping("preUpdateCourse")
	public ModelAndView preUpdateCourse(Integer courseId) {
		// 获取下拉列表的所属年级
		ModelAndView model = new ModelAndView();
		List<GradeInfo> grades = gradeInfoService.getAllGrades();
		model.addObject("grades", grades);
		model.addObject("courseId", courseId);
		model.setViewName("backstage/updateCourse");
		return model;
	}

	@RequestMapping("addCourse")
	public ModelAndView addCourse(Integer division, String courseName, Integer gradeId, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		CourseInfo course = new CourseInfo();
		GradeInfo gradeInfo = new GradeInfo();
		course.setCourseName(courseName);
		course.setDivision(division);
		gradeInfo.setGradeId(gradeId);
		course.setGradeInfo(gradeInfo);
		int row = courseInfoService.addCourse(course);
		if (row > 0) {
			request.setAttribute("msg", "科目添加成功");
		} else {
			request.setAttribute("msg", "科目添加失败");
		}
		model.setViewName("forward:getAllCourses");
		return model;
	}

	@RequestMapping("updateCourse")
	public ModelAndView updateCourse(Integer courseId, Integer division, String courseName, Integer gradeId,
			HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		CourseInfo course = new CourseInfo();
		GradeInfo gradeInfo = new GradeInfo();
		course.setCourseId(courseId);
		course.setCourseName(courseName);
		course.setDivision(division);
		gradeInfo.setGradeId(gradeId);
		course.setGradeInfo(gradeInfo);
		int row = courseInfoService.updateCourse(course);
		if (row > 0) {
			request.setAttribute("msg", "科目修改成功");
		} else {
			request.setAttribute("msg", "科目修改失败");
		}
		model.setViewName("forward:getAllCourses");
		return model;
	}

	@RequestMapping("deleteCourse")
	public ModelAndView deleteCourse(Integer courseId, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		int row = courseInfoService.deleteCourse(courseId);
		if (row > 0) {
			request.setAttribute("msg", "科目删除成功");
		} else {
			request.setAttribute("msg", "科目删除失败");
		}
		model.setViewName("forward:getAllCourses");
		return model;
	}
}
