package com.lcf.dao;

/**
 * dao层 Mapper接口
 * @author liuxiang
 */

import com.lcf.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BooksMapper {
    //增加一个Book
    int addBook(Books book);

    //根据id删除一个Book
    int deleteBookById(@Param("bookId") int id);

    //更新Book
    int updateBook(Books books);

    //根据id查询,返回一个Book
    Books queryBookById(@Param("bookId") int id);

    //如果不传参 则查询全部Book,返回list集合 如果传参 则查询具体内容
    List<Books> queryAllBook(String bookName);
}
