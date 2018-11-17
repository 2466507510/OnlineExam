package com.lijj.exam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lijj.exam.service.C3p0TestTableService;

@Controller
public class C3p0TestTableController {

	@Autowired
	private C3p0TestTableService c3p0TestTableService;

	@Transactional
	@RequestMapping("test")
	public void test() {
		int row1 = c3p0TestTableService.test();
		System.out.println(row1);
	}
}
