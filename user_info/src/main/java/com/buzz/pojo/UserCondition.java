package com.buzz.pojo;

import lombok.Data;

/**
 * @program: ssm
 * @description: 条件查询的时候用到的类
 * @author: buzz
 * @create: 2022-02-13 22:12
 **/
@Data
public class UserCondition {
    private String name;
    private String birthplace;
    private String email;
}
