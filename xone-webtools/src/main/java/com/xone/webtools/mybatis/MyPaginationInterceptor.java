package com.xone.webtools.mybatis;

import java.sql.Connection;
import java.util.Properties;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class }) })
public class MyPaginationInterceptor implements Interceptor {

	//日志对象
	protected static Logger log = LoggerFactory.getLogger(MyPaginationInterceptor.class);
		
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		StatementHandler statementHandler = (StatementHandler)invocation.getTarget();
		MetaObject metaStatementHandler = MetaObject.forObject(statementHandler);
		RowBounds rowBounds = (RowBounds)metaStatementHandler.getValue("delegate.rowBounds");
		if(rowBounds == null || rowBounds == RowBounds.DEFAULT){
			return invocation.proceed();
		}
		Configuration configuration = (Configuration)metaStatementHandler.getValue("delegate.configuration");
		MyDBDialect.DialectType databaseType = null;
		try {
			databaseType = MyDBDialect.DialectType.valueOf(configuration
					.getVariables().getProperty("dialect").toUpperCase());
		} catch (Exception e) {
			// ignore
		}
		if (databaseType == null) {
			log.debug("the value of the dialect property in configuration.xml is not defined:"
					+ configuration.getVariables().getProperty("dialect"));
			return invocation.proceed();
		}
		MyDBDialect dialect = null;
		switch(databaseType){
			case MYSQL://需要实现MySQL的分页逻辑
				dialect = new MySqlDialect();
				break;
			case ORACLE:
				break;
			case DB2:
				break;
			default:
				break;
		}
		if (null == dialect) {
			log.debug("No match dialect, please define dialect property and make sure to implement the dialect.");
			return invocation.proceed();
		}
		String sql = (String)metaStatementHandler.getValue("delegate.boundSql.sql");
		log.debug("====> " + sql);
		metaStatementHandler.setValue("delegate.boundSql.sql", dialect.getLimitResult(sql, rowBounds.getOffset(), rowBounds.getLimit()) );  
        metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET );
        metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT );
//		if (log.isDebugEnabled()) {
			BoundSql boundSql = statementHandler.getBoundSql();
			log.debug("生成分页SQL : " + boundSql.getSql());
//		} 
        return invocation.proceed(); 
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		
	}

}
