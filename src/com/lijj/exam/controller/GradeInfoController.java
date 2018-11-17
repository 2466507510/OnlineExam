package com.lijj.exam.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lijj.exam.pojo.GradeInfo;
import com.lijj.exam.service.GradeInfoService;

@Controller
public class GradeInfoController {

	@Autowired
	private GradeInfoService gradeInfoService;

	@RequestMapping("getAllGrades")
	public ModelAndView getAllGrades(HttpServletRequest request) throws IOException {
		System.out.println(request.getAttribute("msg"));
		ModelAndView model = new ModelAndView();
		List<GradeInfo> grades = gradeInfoService.getAllGrades();
		model.setViewName("forward:backstage/grades.jsp");
		model.addObject("grades", grades);
		return model;
	}

	@RequestMapping("addGrade")
	public String addGrade(String gradeName, HttpServletRequest request) throws IOException {
		int row = gradeInfoService.addGrade(gradeName);
		if (row > 0) {
			request.setAttribute("msg", "年级添加成功");
		} else {
			request.setAttribute("msg", "年级添加失败");
		}
		return "forward:getAllGrades";
	}

	@RequestMapping("deleteGrade")
	public String deleteGrade(Integer gradeId, HttpServletRequest request) {
		int row = 0;
		try {
			row = gradeInfoService.deleteGrade(gradeId);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (row > 0) {
			request.setAttribute("msg", "年级删除成功");
		} else {
			request.setAttribute("msg", "年级删除失败");
		}
		return "forward:getAllGrades";
	}

	@RequestMapping("updateGrade")
	public String updateGrade(GradeInfo grade, HttpServletRequest request) {
		int row = gradeInfoService.updateGrade(grade);
		if (row > 0) {
			request.setAttribute("msg", "年级修改成功");
		} else {
			request.setAttribute("msg", "年级修改失败");
		}
		return "forward:getAllGrades";
	}
}
