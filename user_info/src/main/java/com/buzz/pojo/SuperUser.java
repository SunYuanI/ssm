package com.buzz.pojo;

import lombok.Data;

/**
 * @program: ssm
 * @description: 管理员实体类
 * @author: buzz
 * @create: 2022-02-11 15:14
 **/
@Data
public class SuperUser {
    private int id;
    private String name;
    private String password;
}
