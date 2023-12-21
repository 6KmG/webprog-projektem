package com.test.test;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController

public class TestController {

    @PostMapping("/")
    public String hello() {
        return "Hello!";
    }
    
}
