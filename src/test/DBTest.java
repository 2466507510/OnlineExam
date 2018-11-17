package test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import test.pojo.ClassInfo;


public class DBTest {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		String resource="test/SqlMapConfig-test.xml";
		InputStream is=Resources.getResourceAsStream(resource);
		SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
		SqlSession sqlSession=ssf.openSession();
		List<ClassInfo> list=sqlSession.selectList("selectClass");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getClassId()+"	"+list.get(i).getClassName()+"	"+list.get(i).getGradeId()+"	"+list.get(i).getTeacherId());
		}
	}

}
