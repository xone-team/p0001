package com.xone.webtools.mybatis;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisBeginner {

	public static void main(String[] args) throws Exception {
		String resource = "com/xone/webtools/mybatis/mybatis-configuration.xml";
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			Map<String, Object> params = new HashMap<String, Object>();
//			params.put("productName", "鱼");
//			params.put("ltDateCreated", "2013-07-31 23:34:05");
//			params.put("offsetIndex", "0");
//			params.put("maxResult", "5");
			List<Product> list = productMapper
					.findProductListWithUser(params, new RowBounds(0, 3));
			// User user = (User) session.selectOne("selectUser","1");
			 System.out.println(list.size());
			 Integer i = productMapper.findProductCountWithUser(params);
			 System.out.println(i);
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

}
