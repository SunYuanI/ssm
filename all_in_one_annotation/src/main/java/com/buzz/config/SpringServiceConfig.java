package com.buzz.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-10 16:26
 **/
@Configuration
@ComponentScan(value = {"com.buzz.service.Impl"})
@EnableTransactionManagement
public class SpringServiceConfig {

    @Bean("transactionManager")
    public TransactionManager getTransactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
}
