package com.bookstore.webapp.Aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.bookstore.webapp.Exceptions.BookNotFoundException;
import com.bookstore.webapp.Models.Book;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j(topic = "fileLogger")
public class CreateBookAspect {
    @Before("execution(* com.bookstore.webapp.Services.BookService.createBook(..)) && args(..)")
    public void beforeSaveBook(JoinPoint joinPoint, Book book) {
        log.info("Created: Method call: {} - Data of the book to be created: Title: '{}', Author: '{}', Year: '{}'",
                joinPoint.getSignature().getName(), book.getTitle(), book.getAuthor(), book.getYear());
    }

    @AfterReturning(pointcut = "execution(* com.bookstore.webapp.Services.BookService.createBook(..))", returning = "book")
    public void afterReturningSaveBook(Book book) {
        log.info("Book successfully saved. Created book: ID={}, '{} by {} ({})'", book.getId(), book.getTitle(), book.getAuthor(), book.getYear());
    }

    @AfterThrowing(pointcut = "execution(* com.bookstore.webapp.Services.BookService.createBook(..))", throwing = "exception")
    public void afterThrowingSaveBook(BookNotFoundException exception) {
        log.error(exception.getMessage());
    }
}
