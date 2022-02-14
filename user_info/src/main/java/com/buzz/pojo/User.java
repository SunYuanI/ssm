package com.buzz.pojo;

import lombok.Data;

/**
 * @program: ssm
 * @description: 用户实体类
 * @author: buzz
 * @create: 2022-02-11 15:15
 **/
@Data
public class User {
    private int id;
    private String name;
    private String sex;
    private int age;
    private String birthplace;
    private String qq;
    private String email;
}
