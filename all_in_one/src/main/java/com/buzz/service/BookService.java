package com.buzz.service;

import com.buzz.pojo.Book;

import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @description: BookService
 * @author: buzz
 * @create: 2022-02-10 12:00
 **/
public interface BookService {
    List<Book> findAll();

    int addBook(Book book);

    int updateBook(Book book);

    int deleteBook(int id);

    Book findById(int id);

    List<Book> findByName(String name);
}
