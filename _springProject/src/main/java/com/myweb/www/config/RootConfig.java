package com.myweb.www.config;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


@Configuration
@MapperScan(basePackages = {"com.myweb.www.repository"})
@ComponentScan(basePackages = {"com.myweb.www.service","com.myweb.www.handler","com.myweb.www.exception"})
@EnableAspectJAutoProxy
@EnableScheduling
@EnableTransactionManagement
public class RootConfig {
	//db설정부분
	//전과 달라진 부분 log4jdbc
	//hikariCP 사용
	@Autowired
	ApplicationContext applicationContext;
	@Bean
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		//log4jdbc-log4j2의 드라이버 클래스 url 사용
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost:3306/springdb");
		hikariConfig.setUsername("springuser");
		hikariConfig.setPassword("mysql");
		
		hikariConfig.setMaximumPoolSize(5);
		hikariConfig.setMinimumIdle(5);

		hikariConfig.setConnectionTestQuery("SELECT now()");
		hikariConfig.setPoolName("springHikariCP");
		
		hikariConfig.addDataSourceProperty("dataSource.cacheprepStmts", "true");
		//mysql 드라이버가 한 연결당 cache statment의 수에 관한 설정 기본  보통 25 , 250~500권장
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSize", "250");
		//mysql connection당 캐싱할 preparedStatment
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSqlLimit", "true");
		//mysql 서버에서 최신 이슈가 있을경우 지원받는 설정
		hikariConfig.addDataSourceProperty("dataSource.UseServerPrepStmts", "true");
		
		HikariDataSource hikariDataSource = new HikariDataSource(hikariConfig);
		return hikariDataSource;
	
	}
	@Bean public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlFactoryBean = new SqlSessionFactoryBean();
		sqlFactoryBean.setDataSource(dataSource());
		sqlFactoryBean.setMapperLocations(
					applicationContext.getResources("classpath:/mappers/*.xml"));
		
		sqlFactoryBean.setConfigLocation(
				applicationContext.getResource("classpath:/MybatisConfig.xml"));
		return (SqlSessionFactory)sqlFactoryBean.getObject();
		
	}
	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
	
}
