package com.buzz.dao;

import com.buzz.pojo.Book;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @description: BookMapper
 * @author: buzz
 * @create: 2022-02-10 11:57
 **/
@Repository
public interface BookMapper {
    /**
     * @author buzz
     * @return java.util.List<com.buzz.pojo.Book>
     * @description 查询所有书籍
    */
    List<Book> findAll();

    /**
     * @author buzz
     * @return int
     * @description 添加书籍
    */
    int addBook(Book book);

    /**
     * @author buzz
     * @return int
     * @description 更新书籍
    */
    int updateBook(Map<String, Object> map);

    /**
     * @author buzz
     * @return int
     * @description 删除书籍
    */
    int deleteBook(@Param("id") int id);
}
