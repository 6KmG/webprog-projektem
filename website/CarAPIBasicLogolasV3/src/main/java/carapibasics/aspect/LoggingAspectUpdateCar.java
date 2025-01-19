package carapibasics.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import carapibasics.Todo;

@Aspect
@Component
public class LoggingAspectUpdateCar {
    private final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");

    @Before(value = "execution(* carapibasics.CarController.updateCar(..)) && args(id, updatedCar)", argNames = "joinPoint,id,updatedCar")
    public void logBeforeUpdateCar(JoinPoint joinPoint, Long id, Todo updatedCar) {
        String infoMessage = "\n * Metódus meghívása: " + joinPoint.getSignature().getName() + "\n" +
                " * Módosítás előtt (adatok beolvasása): " +
                "[ID=" + id + ", '" + updatedCar.getBrand() + " " + updatedCar.getModel() + " " + updatedCar.getYear() + "']";
        logInfo.info(infoMessage);
    }

    @SuppressWarnings("ConstantConditions")
    @AfterReturning(pointcut = "execution(* carapibasics.CarController.updateCar(..)) && args(itemId, ..)", returning = "response", argNames = "response,itemId")
    public void logAfterModifyItem(ResponseEntity<Todo> response, Long itemId) {
        Todo car = response.getBody();
        logInfo.info("Az ID={} autó módosítva. Új adatok: [márka: '{}', model: '{}', évjárat: '{}']", itemId, car.getBrand(), car.getModel(), car.getYear());
    }
}