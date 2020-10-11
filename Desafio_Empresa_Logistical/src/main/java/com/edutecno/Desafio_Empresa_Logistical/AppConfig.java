package com.edutecno.Desafio_Empresa_Logistical;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan("com.edutecno.Desafio_Empresa_Logistical")
@PropertySource("classpath:database.properties")
public class AppConfig {
	
	@Autowired
	Environment ambiente;
	
	@Bean
	public DataSource entregaPool () {
		DriverManagerDataSource dmds = new DriverManagerDataSource();
		dmds.setDriverClassName(ambiente.getProperty("driver"));
		dmds.setUrl(ambiente.getProperty("url"));
		dmds.setUsername(ambiente.getProperty("usuario"));
		dmds.setPassword(ambiente.getProperty("clave"));
		
		return dmds;
		
	}
	
	

}
