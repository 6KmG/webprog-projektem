package carapibasics;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;

@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger logError = LoggerFactory.getLogger("fileLoggerError");

    /* Kivételek kezelése */

    // Kivétel kezelése IllegalArgumentException esetén
    /*@ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorResponse handleIllegalArgumentException(IllegalArgumentException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse(
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.getReasonPhrase(),
                e.getMessage(),
                request.getRequestURI()
        );
        String errorMessage = "\nHibakód: \"" + errorResponse.getStatus() + ",\n" +
                "Hibastátusz: \"" + errorResponse.getError() + "\",\n" +
                "Üzenet: \"" + errorResponse.getMessage() + "\",\n" +
                "Útvonal: \"" + errorResponse.getPath() + "\"";
        logError.error(errorMessage);
        return errorResponse;
    }*/

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
        BindingResult result = ex.getBindingResult();
        List<FieldError> fieldErrors = result.getFieldErrors();
        StringBuilder errorMessage = new StringBuilder("A következő mezők érvényesítése nem sikerült:\n");
        fieldErrors.forEach(fieldError -> errorMessage.append("* ").append(fieldError.getField()).append(" (").append(fieldError.getDefaultMessage()).append(")\n"));
        errorMessage.delete(errorMessage.length() - 1, errorMessage.length()); // az utolsó listaelem után sortörés ('\n')
        return errorMessage.toString();
    }

    // Kivétel kezelése CarNotFoundException esetén
    @ExceptionHandler(CarNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ErrorResponse handleCarNotFoundException(CarNotFoundException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse(
                HttpStatus.NOT_FOUND.value(),
                HttpStatus.NOT_FOUND.getReasonPhrase(),
                e.getMessage(),
                request.getRequestURI()
        );
        String errorMessage = "\nHibakód: \"" + errorResponse.getStatus() + ",\n" +
                "Hibastátusz: \"" + errorResponse.getError() + "\",\n" +
                "Üzenet: \"" + errorResponse.getMessage() + "\",\n" +
                "Útvonal: \"" + errorResponse.getPath() + "\"";
        logError.error(errorMessage);
        return errorResponse;
    }
}