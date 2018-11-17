package com.lijj.exam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lijj.exam.dao.C3p0TestTableMapper;
import com.lijj.exam.service.C3p0TestTableService;

@Service
public class C3p0TestTableServiceImpl implements C3p0TestTableService {

	@Autowired
	private C3p0TestTableMapper c3p0TestTableMapper;

	@Transactional
	@Override
	public int test() {
		// TODO Auto-generated method stub
		int row = c3p0TestTableMapper.test();
		int a = 1 / 0;
		int row2 = c3p0TestTableMapper.test();
		return row + row2 + a;
	}

}
