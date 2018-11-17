package com.lijj.exam.util;

import java.util.Map;
import java.util.Set;

import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Magic;
import com.github.abel533.echarts.code.Tool;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.code.X;
import com.github.abel533.echarts.code.Y;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Line;

public class StudentCountJsonUtil {

	public static String createBarJson(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Set<String> set = map.keySet();
//		for (String key : set) {
//			System.out.println(key + "   " + map.get(key));
//		}
		GsonOption option = new GsonOption();
		option.title().text("班级学生数量统计").x(X.center).y(Y.top).borderWidth(1).textStyle().color("#3798E7");
		option.toolbox().show(true)
				.feature(Tool.mark, Tool.restore, new MagicType(Magic.bar, Magic.line), Tool.saveAsImage).x(X.right)
				.y(Y.top);
		option.tooltip().formatter("{b} {c}人").trigger(Trigger.axis);
		option.legend().data("班级总人数").x(X.center).y(Y.bottom).borderWidth(1);
		Line line = new Line("班级总人数");

		// y轴
		ValueAxis valueAxis = new ValueAxis();
		valueAxis.axisLabel().formatter("{value}人").textStyle().color("#3798E7");
		option.yAxis(valueAxis);
		// x轴
		CategoryAxis categoryAxis = new CategoryAxis();
		categoryAxis.axisLabel().interval(0).rotate(-30).textStyle().color("#3798E7");
		for (String className : set) {
			categoryAxis.data(className);
//			System.out.println(className);
//			System.out.println(obj);
			@SuppressWarnings("unchecked")
			Map<String, Integer> mapp = (Map<String, Integer>) map.get(className);
//			System.out.println(mapp.get("className"));
			line.data(mapp.get("studentCount"));
		}
		option.xAxis(categoryAxis);

		line.smooth(true);
		option.series(line);
		option.grid().x(100);

		return option.toString();
	}

}
