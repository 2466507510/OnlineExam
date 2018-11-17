package com.lijj.exam.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class C3p0TestTable {

	private char a;

	public char getA() {
		return a;
	}

	public void setA(char a) {
		this.a = a;
	}
}
