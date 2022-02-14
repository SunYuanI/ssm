package com.buzz.service.Impl;

import com.buzz.dao.SuperUserMapper;
import com.buzz.pojo.SuperUser;
import com.buzz.service.SuperUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-11 19:40
 **/
@Service
public class SuperUserServiceImpl implements SuperUserService {
    private SuperUserMapper superUserMapper;

    @Autowired
    public void setSuperUserMapper(SuperUserMapper superUserMapper) {
        this.superUserMapper = superUserMapper;
    }

    @Override
    public SuperUser getUser(SuperUser superUser) {
        return superUserMapper.getUser(superUser);
    }
}
