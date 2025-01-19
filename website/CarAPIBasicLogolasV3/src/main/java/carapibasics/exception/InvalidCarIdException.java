package carapibasics.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class InvalidCarIdException extends RuntimeException {
    public InvalidCarIdException(String message) {
        super(message);
    }
}
