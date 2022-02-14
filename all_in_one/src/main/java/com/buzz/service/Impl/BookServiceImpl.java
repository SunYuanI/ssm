package com.buzz.service.Impl;

import com.buzz.dao.BookMapper;
import com.buzz.pojo.Book;
import com.buzz.service.BookService;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @description: BookService实现类
 * @author: buzz
 * @create: 2022-02-10 12:01
 **/
@Service("bookService")
public class BookServiceImpl implements BookService {
    private BookMapper mapper;

    @Autowired
    public void setMapper(BookMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public List<Book> findAll() {
        return mapper.findAll();
    }

    @Override
    public int addBook(Book book) {
        return mapper.addBook(book);
    }

    @Override
    public int updateBook(Map<String, Object> map) {
        return mapper.updateBook(map);
    }

    @Override
    public int deleteBook(int id) {
        return mapper.deleteBook(id);
    }
}
