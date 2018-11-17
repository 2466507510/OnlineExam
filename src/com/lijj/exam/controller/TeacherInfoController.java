package com.lijj.exam.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lijj.exam.pojo.TeacherInfo;
import com.lijj.exam.service.TeacherInfoService;

@Controller
public class TeacherInfoController {

	@Autowired
	private TeacherInfoService teacherInfoService;

	@RequestMapping("validateTeacher")
	public void validateTeacher(String teacherAccount, HttpServletResponse response) throws IOException {
		TeacherInfo teacher = teacherInfoService.getTeacher(teacherAccount);
//		System.out.println(teacher);
		if (teacher == null) {
			response.getWriter().print("no");
		} else {
			response.getWriter().print(teacher.getTeacherPwd());
		}
	}

	@RequestMapping("teacherLogin")
	public ModelAndView teacherlogin(String teacherAccount, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		TeacherInfo teacher = teacherInfoService.getTeacher(teacherAccount);
		HttpSession session = request.getSession();
		session.setAttribute("loginTeacher", teacher);
		session.setAttribute("adminPower", teacher.getAdminPower());
		model.setViewName("redirect:backstage/index.jsp");
		return model;
	}

	@RequestMapping("teacherExit")
	public String teacherExit(HttpSession session) {
		session.removeAttribute("loginTeacher");
		session.removeAttribute("adminPower");
		return "redirect:backstage/index.jsp";
	}

	@RequestMapping("getAllTeachers")
	public ModelAndView getAllTeachers(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		List<TeacherInfo> teachers = teacherInfoService.getAllTeachers();
		model.addObject("teachers", teachers);
		model.setViewName("forward:backstage/teachers.jsp");
		return model;
	}

}
