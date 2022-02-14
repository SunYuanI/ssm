package com.buzz.dao;

import com.buzz.pojo.User;
import com.buzz.pojo.UserCondition;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-11 15:20
 **/
public interface UserMapper {

    List<User> findAll();

    int addUser(User user);

    int deleteUser(@Param("uid") int id);

    int updateUser(User user);

    User findById(@Param("uid") int id);

    int getCounts(Map<String, Object> map);

    List<User> findByLimit(Map<String, Object> map);
}
