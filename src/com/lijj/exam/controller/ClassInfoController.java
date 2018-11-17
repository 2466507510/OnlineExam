package com.lijj.exam.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lijj.exam.pojo.ClassInfo;
import com.lijj.exam.pojo.GradeInfo;
import com.lijj.exam.pojo.TeacherInfo;
import com.lijj.exam.service.ClassInfoService;
import com.lijj.exam.service.GradeInfoService;
import com.lijj.exam.service.TeacherInfoService;
import com.lijj.exam.util.StudentCountJsonUtil;

@Controller
public class ClassInfoController {

	@Autowired
	private ClassInfoService classInfoService;
	@Autowired
	private GradeInfoService gradeInfoService;
	@Autowired
	private TeacherInfoService teacherInfoService;
	@Autowired
	private Gson gson;

	private Logger logger = Logger.getLogger(ClassInfoController.class);

	@RequestMapping("/studentRegisterClassSelect")
	public ModelAndView getStudentRegisterClassSelect(HttpServletRequest request, HttpServletResponse response) {
		logger.info("获取所有班级");
		ModelAndView view = new ModelAndView("reception/register");
		response.setContentType("text/html;charset=UTF-8");
		/*
		 * Map<String, String> map=new HashMap<>(); List<Map<String, String>> list=new
		 * ArrayList<>();
		 */
		List<ClassInfo> classes = classInfoService.getStudentRegisterClassSelect();
		/*
		 * for(int i=0;i<classes.size();i++) {
		 * System.out.println(String.valueOf(classes.get(i).getClassId()));
		 * System.out.println(classes.get(i).getClassName()); map.put("classId",
		 * String.valueOf(classes.get(i).getClassId())); map.put("className",
		 * classes.get(i).getClassName()); list.add(map); }
		 */
//		request.setAttribute("classes", classes);
//		request.getRequestDispatcher("result.jsp").forward(request, response);
//		String json=gson.toJson(classes);
//		System.out.println(json);
//		response.getWriter().print(json);
		view.addObject("classes", classes);
		return view;
	}

	@RequestMapping("getGradeClasses")
	public void getGradeClasses(Integer gradeId, HttpServletResponse response) throws IOException {
		List<ClassInfo> classes = classInfoService.getClassesByGradeId(gradeId);
		String json = gson.toJson(classes);
		System.out.println(json);
		response.getWriter().print(json);
	}

	@RequestMapping("getClassByClassId")
	public ModelAndView getClassByClassId(Integer classId) {
		ModelAndView model = new ModelAndView();
		List<ClassInfo> classes = classInfoService.getClassByClassId(classId);
		model.setViewName("backstage/classes");
		model.addObject("classes", classes);
		return model;
	}

	@RequestMapping("getAllClasses")
	public ModelAndView getAllClasses(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		List<ClassInfo> classes = classInfoService.getAllClasses();
		model.setViewName("forward:backstage/classes.jsp");
		model.addObject("classes", classes);
		return model;
	}

	@RequestMapping("preAddClass")
	public ModelAndView preAddClass() {
		ModelAndView model = new ModelAndView();
		List<GradeInfo> grades = gradeInfoService.getAllGrades();
		List<TeacherInfo> teachers = teacherInfoService.getTeachersByWork();
		model.setViewName("backstage/addClass");
		model.addObject("grades", grades);
		model.addObject("teachers", teachers);
		System.out.println(teachers);
		return model;
	}

	@RequestMapping("addClass")
	public ModelAndView addClass(Integer gradeId, Integer teacherId, String className, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		ClassInfo _class = new ClassInfo();
		GradeInfo grade = new GradeInfo();
		TeacherInfo teacher = new TeacherInfo();
		_class.setClassName(className);
		grade.setGradeId(gradeId);
		teacher.setTeacherId(teacherId);
		teacher.setIsWork(1);
		_class.setGradeInfo(grade);
		_class.setTeacherInfo(teacher);
		// 添加班级的同时会安排班主任，被安排的班主任的工作状态从0变成1，还需要修改教师的IsWork字段
		int row = classInfoService.addClassAndUpdateTeacherIsWork(_class);
		System.out.println(row);
		if (row > 1) {
			request.setAttribute("msg", "班级添加成功");
		} else {
			request.setAttribute("msg", "班级添加失败");
		}
		model.setViewName("forward:getAllClasses");
		return model;
	}

	@RequestMapping("preUpdateClass")
	public ModelAndView preUpdateClass(Integer classId, Integer oldTeacherId) {
		// System.out.println(classId + " " + oldTeacherId);
		ModelAndView model = new ModelAndView();
		List<TeacherInfo> teachers = teacherInfoService.getTeachersByWork();
		List<GradeInfo> grades = gradeInfoService.getAllGrades();
		model.addObject("teachers", teachers);
		model.addObject("grades", grades);
		model.addObject("classId", classId);
		model.addObject("oldTeacherId", oldTeacherId);
		model.setViewName("backstage/updateClass");
		return model;
	}

	@RequestMapping("updateClass")
	public ModelAndView updateClass(@Param("classId") Integer classId, @Param("gradeId") Integer gradeId,
			@Param("teacherId") Integer teacherId, @Param("className") String className,
			@Param("oldTeacherId") Integer oldTeacherId, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		System.out.println(classId + "   " + gradeId + "   " + teacherId + "   " + className);
		Map<String, Object> map = new HashMap<>();
		map.put("classId", classId);
		map.put("gradeId", gradeId);
		map.put("teacherId", teacherId);
		map.put("className", className);
		map.put("oldTeacherId", oldTeacherId);
		int row = classInfoService.updateClass(map);
		if (row > 2) {
			request.setAttribute("msg", "班级修改成功");
		} else {
			request.setAttribute("msg", "班级修改失败");
		}
		model.setViewName("forward:getAllClasses");
		return model;
	}

	@RequestMapping("deleteClass")
	public ModelAndView deleteClass(Integer classId, Integer oldTeacherId, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		int row = classInfoService.deleteClassAndUpdateTeacherIsWork(classId, oldTeacherId);
		if (row > 1) {
			request.setAttribute("msg", "班级删除成功");
		} else {
			request.setAttribute("msg", "班级删除成功");
		}
		model.setViewName("forward:getAllClasses");
		return model;
	}

	@RequestMapping("getStudentCount")
	public void getStudentCount(@Param("gradeId") Integer gradeId, HttpServletResponse response) throws IOException {
		// System.out.println(gradeId);
		Map<String, Object> map = classInfoService.getStudentCountByClass(gradeId);
		String json = StudentCountJsonUtil.createBarJson(map);
		// System.out.println(json);
		response.getWriter().print(json);
		// System.out.println(map);
	}
}
