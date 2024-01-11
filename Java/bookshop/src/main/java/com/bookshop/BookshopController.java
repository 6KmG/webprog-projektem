package com.bookshop;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class BookshopController {
    @RequestMapping
    public String hello(){
        return "Hi";
    }
    
}
