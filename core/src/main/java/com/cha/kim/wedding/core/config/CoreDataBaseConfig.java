package com.cha.kim.wedding.core.config;

import com.cha.kim.wedding.core.CoreApplication;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;


@EnableJpaRepositories(basePackageClasses = CoreApplication.class)
@EnableTransactionManagement
public class CoreDataBaseConfig {
	@Value("${core.database.driver}")
	private String dataBaseDriver;
	@Value("${core.database.jdbc.url}")
	private String jdbcUrl;
	@Value("${core.database.username}")
	private String dataBaseUserName;
	@Value("${core.database.password}")
	private String dataBasePassword;


	@Bean
	public DataSource dataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(dataBaseDriver);
		ds.setUrl(jdbcUrl);
		ds.setUsername(dataBaseUserName);
		ds.setPassword(dataBasePassword);
		ds.setValidationQuery("SELECT 1");
		ds.setDefaultAutoCommit(true);
		ds.setMaxIdle(10);
		ds.setMaxTotal(10);
		ds.setMinIdle(5);
		ds.setMaxWaitMillis(6000);
		ds.setTestWhileIdle(true);
		ds.setTimeBetweenEvictionRunsMillis(30000);
		ds.setInitialSize(10);
		return ds;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {

		HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		vendorAdapter.setDatabase(Database.MYSQL);
		vendorAdapter.setGenerateDdl(true);
		vendorAdapter.setShowSql(true);
		LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
		factory.setJpaVendorAdapter(vendorAdapter);
		factory.setPackagesToScan("com.cha.kim.wedding.*");
		factory.setDataSource(dataSource());
		return factory;
	}

	@Bean
	public PlatformTransactionManager transactionManager() {

		JpaTransactionManager txManager = new JpaTransactionManager();
		txManager.setEntityManagerFactory(entityManagerFactory().getObject());
		return txManager;
	}
}
