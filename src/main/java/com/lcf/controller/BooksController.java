package com.lcf.controller;

/**
 * Controller层
 * @Author liuxiang
 */

import com.lcf.pojo.Books;
import com.lcf.service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BooksController {

    //controller层调service层
    @Autowired
    private BooksService booksService;

    @RequestMapping("/")
    public String protal() {
        //将逻辑视图返回
        return "index";
    }
    /**
     * 查询全部书籍
     * @param model
     * @return 返回书籍展示页面
     */

    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> books = booksService.queryAllBook(null);
        model.addAttribute("list",books);
        return "allBook";
    }

    /**
     * 查询指定名字的书籍
     * @param queryBookName 要查询的书籍
     * @param model 封装查询到的数据
     * @return 返回页面 注意:此处不能使用重定向
     */
    @RequestMapping("/queryBookName")
    public String listall(String queryBookName,Model model){
        String trim = queryBookName.trim();
        List<Books> books = booksService.queryAllBook(trim);
        model.addAttribute("list",books);
        return "allBook";
    }

    /**
     * 新增页面
     * @return 跳转到新增书籍页面
     */
    @RequestMapping("/toAddBook")
    public String toaddBook(Model model){
        model.addAttribute("msg","成功跳转页面");
        return "addBook";
    }

    /**
     * 新增书籍数据
     * @param books 添加表单值
     * @return 重定向到查询页
     */
    @RequestMapping("/addBook")
    public String addBook(Books books){
        booksService.addBook(books);
        return "redirect:/book/allBook";
    }

    /**
     * 基于id查询对应数据 返回修改页面
     * @param id 修改数据的id
     * @param modle 封装书籍id对应的数据
     * @return 返回一个修改页面
     */
    @RequestMapping("/toUpdateBook")
    public String updateBook(int id,Model modle){
        Books books = booksService.queryBookById(id);
        modle.addAttribute("Qbooks",books);
        return "updateBook";
    }

    /**
     * 修改表单数据
     * @param books 修改数据
     * @return 重定向到查询页
     */
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        int i = booksService.updateBook(books);
        return "redirect:/book/allBook";
    }

    /**
     * 删除书籍
     * @param bookId 需要删除的书籍id
     * @return 重定向到查询页
     */
    @RequestMapping("/del/{bookId}")
    public String delBook(@PathVariable int bookId){
        booksService.deleteBookById(bookId);
        return "redirect:/book/allBook";
    }

}
