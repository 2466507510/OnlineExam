package com.lijj.exam.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
/*
 * @component （把普通pojo实例化到spring容器中，相当于配置文件中的 <bean id="" class=""/>）
 * 
 * 泛指各种组件，就是说当我们的类不属于各种归类的时候（不属于@Controller、@Services等的时候），我们就可以使用@
 * Component来标注这个类。
 */
@Scope("prototype")
/*
 * spring中bean的scope属性，有如下5种类型：
 * 
 * singleton 表示在spring容器中的单例，通过spring容器获得该bean时总是返回唯一的实例
 * prototype表示每次获得bean都会生成一个新的对象 request表示在一次http请求内有效（只适用于web应用）
 * session表示在一个用户会话内有效（只适用于web应用） globalSession表示在全局会话内有效（只适用于web应用）
 */
public class TeacherInfo {

	private Integer teacherId;
	private String teacherName;
	private String teacherAccount;
	private String teacherPwd;
	private Integer adminPower;
	private Integer isWork;
	private ClassInfo classInfo;

	public ClassInfo getClassInfo() {
		return classInfo;
	}

	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherAccount() {
		return teacherAccount;
	}

	public void setTeacherAccount(String teacherAccount) {
		this.teacherAccount = teacherAccount;
	}

	public String getTeacherPwd() {
		return teacherPwd;
	}

	public void setTeacherPwd(String teacherPwd) {
		this.teacherPwd = teacherPwd;
	}

	public Integer getAdminPower() {
		return adminPower;
	}

	public void setAdminPower(Integer adminPower) {
		this.adminPower = adminPower;
	}

	public Integer getIsWork() {
		return isWork;
	}

	public void setIsWork(Integer isWork) {
		this.isWork = isWork;
	}

}
