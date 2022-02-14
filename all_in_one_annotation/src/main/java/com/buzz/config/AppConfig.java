package com.buzz.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-10 12:29
 **/
@Configuration
@Import({SpringDaoConfig.class, SpringServiceConfig.class})
public class AppConfig {
}
