package com.buzz.test;

import com.buzz.dao.UserMapper;
import com.buzz.pojo.SuperUser;
import com.buzz.pojo.User;
import com.buzz.pojo.UserCondition;
import com.buzz.service.SuperUserService;
import com.buzz.service.UserService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @description: 测试类
 * @author: buzz
 * @create: 2022-02-11 19:48
 **/
public class BasicTest {
    @Before
    public void ini() {

    }

    @Test
    public void test() {
//        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = context.getBean("userMapper", UserMapper.class);
//        UserCondition condition = new UserCondition();
//        condition.setName("bezz");
//        condition.setBirthplace("abcd");
//        Map<String, Object> map = new HashMap<>();
//        map.put("userCondition", condition);
//        int counts = userMapper.getCounts(map);
//        System.out.println(counts);
//        map.put("limit", 2);
//        map.put("offset", 0);
//        List<User> byLimit = userMapper.findByLimit(map);
//       System.out.println(byLimit);
        Map<String, String> map = new HashMap<>();
        map.put(null, "fda");
        System.out.println(map.size());

    }

    @After
    public void destory() {

    }
}
