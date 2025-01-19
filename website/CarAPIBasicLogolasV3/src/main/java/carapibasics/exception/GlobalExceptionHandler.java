package carapibasics.exception;

import carapibasics.ErrorResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    // Kivétel kezelése CarNotFoundException esetén
    // Ez a kivételkezelő nem szükséges, ha a CarNotFoundException osztályhoz @ResponseStatus annotáció van beállítva
    /*@ExceptionHandler(CarNotFoundException.class)
    private ResponseEntity<?> handleUserNotFoundException(CarNotFoundException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse(
                HttpStatus.NOT_FOUND.value(),
                HttpStatus.NOT_FOUND.getReasonPhrase(),
                e.getMessage(),
                request.getRequestURI()
        );
        String errorMessage = "\nHibakód: " + errorResponse.getStatus() + ",\n" +
                "Hibastátusz: \"" + errorResponse.getError() + "\",\n" +
                "Üzenet: \"" + errorResponse.getMessage() + "\",\n" +
                "Útvonal: \"" + errorResponse.getPath() + "\"";
        logError.error(errorMessage);
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorResponse);
    }*/

    // Kivétel kezelése ConstraintViolationException esetén
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

    // Validáláshoz szükséges kivételkezelő
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleValidationException(MethodArgumentNotValidException ex) {
        BindingResult result = ex.getBindingResult();
        List<FieldError> fieldErrors = result.getFieldErrors();
        StringBuilder errorMessage = new StringBuilder("A következő mezők érvényesítése nem sikerült:\n");
        // Ha a @NotBlank/@NotNull annotációhoz megadunk alapértelmezett hibaüzenetet a Car osztályban
        fieldErrors.forEach(fieldError -> errorMessage.append("* ").append(fieldError.getField()).append(" (").append(fieldError.getDefaultMessage()).append(")\n"));
        errorMessage.delete(errorMessage.length() - 1, errorMessage.length()); // az utolsó listaelem után sortörés törlése
        logError.error(errorMessage.toString());
        return errorMessage.toString();
    }
}
