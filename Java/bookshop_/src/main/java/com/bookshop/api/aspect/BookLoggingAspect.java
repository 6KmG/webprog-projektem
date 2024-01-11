package com.bookshop.api.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.bookshop.api.model.Book;

import java.util.Arrays;
import java.util.List;

@Aspect
@Component
public class BookLoggingAspect {
    private static final Logger logger = LoggerFactory.getLogger("fileLogger");
    @Before("execution(* com.konyvesbolt.api.service.BookService.saveBook(com.konyvesbolt.api.model.Book))")
    public void beforeSaveBook(JoinPoint joinPoint) {
        Book book = (Book) joinPoint.getArgs()[0];
        if (book.getId() != null) {
            logger.info("Updating book "+book.getId()+" '"+book.getTitle()+"' by '"+book.getAuthor()+"'");
        }
        else{
            logger.info("Saving new book '"+book.getTitle()+"' by '"+book.getAuthor()+"'");
        }
    }

    @AfterReturning("execution(* com.konyvesbolt.api.service.BookService.saveBook(com.konyvesbolt.api.model.Book))")
    public void afterSaveBook(JoinPoint joinPoint) {
        Book book = (Book) joinPoint.getArgs()[0];
        logger.info("Saved book '"+book.getTitle()+"' by '"+book.getAuthor()+"' with id:"+book.getId()+"!");
    }

    @AfterReturning("execution(* com.konyvesbolt.api.service.BookService.deleteBookById(Long))")
    public void afterDeletingBook(JoinPoint joinPoint){
        logger.info("Book with id "+(Long)joinPoint.getArgs()[0]+" was deleted.");
    }
}
