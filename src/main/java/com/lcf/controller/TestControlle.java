package com.lcf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

public class TestControlle {

    @Controller
    public class HelloController {

        @RequestMapping("/")
        public String protal() {
            //将逻辑视图返回
            return "index";
        }
    }
}