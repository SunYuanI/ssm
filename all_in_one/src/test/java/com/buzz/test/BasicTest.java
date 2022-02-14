package com.buzz.test;

import com.buzz.pojo.Book;
import com.buzz.service.BookService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @program: ssm
 * @description: 测试类
 * @author: buzz
 * @create: 2022-02-10 12:02
 **/
public class BasicTest {
    @Before
    public void ini() {

    }

    @Test
    public void test() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BookService bookService = context.getBean("bookService", BookService.class);
        List<Book> java = bookService.findByName("Java");
        System.out.println(java);
    }

    @After
    public void destory() {

    }
}
