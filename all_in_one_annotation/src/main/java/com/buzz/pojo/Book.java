package com.buzz.pojo;

import lombok.Data;

/**
 * @program: ssm
 * @description: 书籍实体类
 * @author: buzz
 * @create: 2022-02-10 11:56
 **/
@Data
public class Book {
    private int id;
    private String name;
    private int count;
    private String detail;
}
