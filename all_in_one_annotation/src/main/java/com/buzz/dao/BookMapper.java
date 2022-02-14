package com.buzz.dao;

import com.buzz.pojo.Book;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @program: ssm
 * @description: BookMapper
 * @author: buzz
 * @create: 2022-02-10 11:57
 **/
@Repository
public interface BookMapper {
    List<Book> findAll();
}
