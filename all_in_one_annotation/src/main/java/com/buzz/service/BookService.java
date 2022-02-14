package com.buzz.service;

import com.buzz.pojo.Book;

import java.util.List;

/**
 * @program: ssm
 * @description: BookService
 * @author: buzz
 * @create: 2022-02-10 12:00
 **/
public interface BookService {
    List<Book> findAll();
}
