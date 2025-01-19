package com.todoapi.todoapi.exception;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.todoapi.todoapi.ErrorResponse;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolationException;

@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger logError = LoggerFactory.getLogger("fileLoggerError");

    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    private ErrorResponse handleConstraintViolationException(ConstraintViolationException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse(
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.getReasonPhrase(),
                e.getMessage(),
                request.getRequestURI()
        );
        String errorMessage = "\nHibakód: " + errorResponse.getStatus() + ",\n" +
                "Hibastátusz: \"" + errorResponse.getError() + "\",\n" +
                "Üzenet: \"" + errorResponse.getMessage() + "\",\n" +
                "Útvonal: \"" + errorResponse.getPath() + "\"";
        logError.error(errorMessage);
        return errorResponse;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleValidationException(MethodArgumentNotValidException ex) {
        BindingResult result = ex.getBindingResult();
        List<FieldError> fieldErrors = result.getFieldErrors();
        StringBuilder errorMessage = new StringBuilder("A következő mezők érvényesítése nem sikerült:\n");
        fieldErrors.forEach(fieldError -> errorMessage.append("* ").append(fieldError.getField()).append(" (").append(fieldError.getDefaultMessage()).append(")\n"));
        errorMessage.delete(errorMessage.length() - 1, errorMessage.length()); // az utolsó listaelem után sortörés törlése
        logError.error(errorMessage.toString());
        return errorMessage.toString();
    }
}
