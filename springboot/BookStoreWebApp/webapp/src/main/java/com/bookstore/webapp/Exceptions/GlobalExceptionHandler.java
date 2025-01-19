package com.bookstore.webapp.Exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.NoResourceFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {
    
    private static final Logger logger = LoggerFactory.getLogger("fileLogger");

    @ExceptionHandler(NoResourceFoundException.class)
    public void handleNoResourceFoundException(NoResourceFoundException ex) {
        // Do nothing or log a message at a lower level
    }

    @ExceptionHandler(BookNotFoundException.class)
    public ModelAndView handleBookNotFoundException(BookNotFoundException ex) {
        logger.error("Book not found: {}", ex.getMessage());
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("errorMessage", ex.getMessage());
        mav.setStatus(HttpStatus.NOT_FOUND);
        return mav;
    }

    @ExceptionHandler(InvalidBookDataException.class)
    public ModelAndView handleInvalidBookDataException(InvalidBookDataException ex) {
        logger.error("Invalid book data: {}", ex.getMessage());
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("errorMessage", ex.getMessage());
        mav.setStatus(HttpStatus.BAD_REQUEST);
        return mav;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleGenericException(Exception ex) {
        logger.error("An unexpected error occurred: {}", ex.getMessage(), ex);
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("errorMessage", "An unexpected error occurred. Please try again later.");
        mav.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
        return mav;
    }
}