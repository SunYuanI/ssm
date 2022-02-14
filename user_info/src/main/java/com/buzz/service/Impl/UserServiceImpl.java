package com.buzz.service.Impl;

import com.buzz.dao.UserMapper;
import com.buzz.pojo.User;
import com.buzz.pojo.UserCondition;
import com.buzz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-11 19:41
 **/
@Service
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public User findById(int id) {
        return userMapper.findById(id);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return userMapper.deleteUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int getCounts(UserCondition condition) {
        Map<String, Object> map = new HashMap<>();
        map.put("userCondition", condition);
        return userMapper.getCounts(map);
    }

    @Override
    public List<User> findByPage(int currentPage, int pageSize, UserCondition condition) {
        Map<String, Object> map = new HashMap<>();
        map.put("limit", pageSize);
        map.put("offset", (currentPage - 1) * pageSize);
        map.put("userCondition", condition);
        return userMapper.findByLimit(map);
    }

    @Override
    public int deleteSelect(int[] ids) {
        int rst = 0;
        for (int id : ids) {
            rst += deleteUser(id);
        }
        return rst;
    }
}
