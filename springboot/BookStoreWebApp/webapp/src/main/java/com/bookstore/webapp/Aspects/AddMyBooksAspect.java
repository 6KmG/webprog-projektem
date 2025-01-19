package com.bookstore.webapp.Aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j(topic = "fileLogger")
public class AddMyBooksAspect {
    @Before("execution(* com.bookstore.webapp.Services.MyBookService.addBookToMyBooks(..)) && args(bookId)")
    public void beforeAddBookToMyBooks(JoinPoint joinPoint, Long bookId) {
        log.info("Method call: {} - Adding book with ID={} to my books.", joinPoint.getSignature().getName(), bookId);
    }

    @AfterReturning("execution(* com.bookstore.webapp.Services.MyBookService.addBookToMyBooks(..)) && args(bookId)")
    public void afterReturningAddBookToMyBooks(Long bookId) {
        log.info("Book with ID={} successfully added to my books.", bookId);
    }

    @AfterThrowing(pointcut = "execution(* com.bookstore.webapp.Services.MyBookService.addBookToMyBooks(..))", throwing = "exception")
    public void afterThrowingAddBookToMyBooks(Exception exception) {
        log.error("Error occurred while adding book to my books: {}", exception.getMessage());
    }
}
