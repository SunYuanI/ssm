package com.buzz.test;

import com.buzz.config.AppConfig;
import com.buzz.pojo.Book;
import com.buzz.service.BookService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

/**
 * @program: ssm
 * @description: 测试类
 * @author: buzz
 * @create: 2022-02-10 16:50
 **/
public class BasicTest {
    @Before
    public void ini() {

    }

    @Test
    public void test() {
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        BookService bookService = context.getBean("bookService", BookService.class);
        List<Book> all = bookService.findAll();
        all.forEach(System.out::println);
    }

    @After
    public void destory() {

    }
}
