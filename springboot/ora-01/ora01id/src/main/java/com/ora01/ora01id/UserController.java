package com.ora01.ora01id;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class UserController {
    @GetMapping("/path")
    public String sayHi() {
        return "Hi!";
    }
    
}
