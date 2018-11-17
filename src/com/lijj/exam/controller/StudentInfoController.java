package com.lijj.exam.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lijj.exam.pojo.ClassInfo;
import com.lijj.exam.pojo.StudentInfo;
import com.lijj.exam.service.StudentInfoService;

@Controller
public class StudentInfoController {

	@Autowired
	private StudentInfoService studentInfoService;
	@Autowired
	private StudentInfo studentInfo;
	@Autowired
	private ClassInfo classInfo;

	private Logger logger = Logger.getLogger(StudentInfoController.class);

	@RequestMapping("validateStudentAccount")
	public void validateStudentAccount(String studentAccount, HttpServletResponse response) throws IOException {
		logger.info("验证学生账户" + studentAccount + "是否被注册");
		List<StudentInfo> students = studentInfoService.getStudent(studentAccount);
//		System.out.println(students);
		if (null == students || students.size() == 0) {
			response.getWriter().print("t");
		} else {
//			System.out.println(students.get(0).getStudentPwd());
			response.getWriter().print(students.get(0).getStudentPwd());
//			response.getWriter().print("f");
		}
//		System.out.println(student.getStudentAccount() + student.getStudentName() + student.getStudentPwd()
//				+ student.getStudentId());
	}

	@RequestMapping("studentRegister")
	public void studentRegister(String studentName, String studentAccount, String studentPwd, Integer studentClassId,
			HttpServletResponse response) throws IOException {
		studentInfo.setStudentName(studentName);
		studentInfo.setStudentAccount(studentAccount);
		studentInfo.setStudentPwd(studentPwd);
		classInfo.setClassId(studentClassId);
		studentInfo.setClassInfo(classInfo);
		int row = studentInfoService.studentRegister(studentInfo);
		if (row > 0) {
			response.getWriter().print("t");
		} else {
			response.getWriter().print("f");
		}
	}

	@RequestMapping("/studentLogin")
	public ModelAndView studentLogin(String studentAccount, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		List<StudentInfo> students = studentInfoService.getStudent(studentAccount);
		StudentInfo loginStudent = students.get(0);
		System.out.println(loginStudent);
		request.getSession().setAttribute("loginStudent", loginStudent);
		model.setViewName("reception/success");
		model.addObject("success", "登录成功");
		return model;
	}

	@RequestMapping("studentExit")
	public String studentExit(HttpSession session) {
		session.removeAttribute("loginStudent");
		return "redirect:index.jsp";
	}

	@RequestMapping("selfInformation")
	public ModelAndView selfInformation(Integer studentId) {
//		System.out.println(studentId);
		ModelAndView model = new ModelAndView();
		StudentInfo student = studentInfoService.getStudentById(studentId);
		/*
		 * System.out.println(student); System.out.println(student.getStudentId());
		 * System.out.println(student.getStudentAccount());
		 * System.out.println(student.getStudentName());
		 * System.out.println(student.getStudentPwd());
		 * System.out.println(student.getClassInfo().getClassId());
		 * System.out.println(student.getClassInfo().getClassName());
		 * System.out.println(student.getGradeInfo().getGradeId());
		 * System.out.println(student.getGradeInfo().getGradeName());
		 */
		model.setViewName("reception/selfInformation");
		model.addObject("student", student);
		return model;
	}

	@RequestMapping(value = "resetStudentPwd", method = RequestMethod.POST)
	public String resetStudentPwd(StudentInfo student, HttpServletResponse response) throws IOException {
		int row = studentInfoService.resetStudentPwd(student);
		if (row > 0) {
			response.getWriter().print("t");
		} else {
			response.getWriter().print("f");
		}
		return null;
	}

}
