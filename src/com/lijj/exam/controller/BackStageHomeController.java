package com.lijj.exam.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lijj.exam.service.ExamPaperInfoService;
import com.lijj.exam.service.StudentInfoService;
import com.lijj.exam.service.SubjectInfoService;
import com.lijj.exam.service.TeacherInfoService;

@Controller
public class BackStageHomeController {

	@Autowired
	private StudentInfoService studentInfoService;
	@Autowired
	private TeacherInfoService teacherInfoService;
	@Autowired
	private SubjectInfoService subjectInfoService;
	@Autowired
	private ExamPaperInfoService examPaperInfoService;

	@RequestMapping("homeInfo")
	public void homeInfo(HttpServletResponse response) throws IOException {
		int studentTotal = studentInfoService.getStudentTotal();
//		System.out.println(studentTotal);
		int teacherTotal = teacherInfoService.getTeacherTotal();
//		System.out.println(teacherTotal);
		int subjectTotal = subjectInfoService.getSubjectTotal();
//		System.out.println(subjectTotal);
		int examPaperTotal = examPaperInfoService.getExamPaperTotal();
//		System.out.println(examPaperTotal);
		String json = "{\"examPaperTotal\":" + examPaperTotal + ", " + "\"subjectTotal\":" + subjectTotal + ", "
				+ "\"teacherTotal\":" + teacherTotal + ", " + "\"studentTotal\":" + studentTotal + "}";
		System.out.println(json);
		response.getWriter().print(json);
	}
}
