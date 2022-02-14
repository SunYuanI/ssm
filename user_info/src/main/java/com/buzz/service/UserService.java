package com.buzz.service;

import com.buzz.pojo.User;
import com.buzz.pojo.UserCondition;

import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-11 19:34
 **/
public interface UserService {

    List<User> findAll();

    User findById(int id);

    int addUser(User user);

    int deleteUser(int id);

    int updateUser(User user);

    int getCounts(UserCondition condition);

    List<User> findByPage(int currentPage, int pageSize, UserCondition condition);

    int deleteSelect(int[] ids);
}
