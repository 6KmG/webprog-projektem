package com.todoapi.todoapi.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class InvalidTodoIdException extends RuntimeException {
    public InvalidTodoIdException(String message) {
        super(message);
    }
}
