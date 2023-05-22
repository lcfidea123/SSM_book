package com.lcf.service;

import com.lcf.pojo.Books;

import java.util.List;

public interface BooksService {

    //增加一个Book
    int addBook(Books book);
    //根据id删除一个Book
    int deleteBookById(int id);
    //更新Book
    int updateBook(Books books);
    //根据id查询,返回一个Book
    Books queryBookById(int id);
    //如果不传参 则查询全部Book,返回list集合 如果传参 则查询具体内容
    List<Books> queryAllBook(String bookName);
}
