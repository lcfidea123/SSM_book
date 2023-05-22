package com.lcf.service;

import com.lcf.dao.BooksMapper;
import com.lcf.pojo.Books;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public class BooksServiceImpl implements BooksService {
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private BooksMapper bookMapper;

    public void setBookMapper(BooksMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    public int addBook(Books book) {
        return bookMapper.addBook(book);
    }

    @Override
    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    @Override
    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    @Override
    public List<Books> queryAllBook(String bookName) {
        List<Books> books = bookMapper.queryAllBook(bookName);
        if (books.size()==0){ //判断是否查询到值 如果没查询到 则查全量
            books= bookMapper.queryAllBook(null);
        }
        return books;
    }
}
