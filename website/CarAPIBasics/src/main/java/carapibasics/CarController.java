package carapibasics;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;

@RestController
@RequestMapping("/cars")
@Validated
public class CarController {
    // Logoláshoz szükséges objektumok
    private static final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");
    private static final Logger logError = LoggerFactory.getLogger("fileLoggerError");

    // Lista inicializálása
    private final List<Car> carList = new ArrayList<>(Arrays.asList(
            new Car(1L, "Ferrari", "SF90 Spider", 2024),
            new Car(2L, "Mercedes", "GLC 63 Luxury SUV", 2020)
    ));

    @GetMapping
    public Object getAllCars() {
        logInfo.info("Az autó lista lekérdezve.");
        return carList.isEmpty() ? "Nem található autó a listában." : carList;
    }

    @GetMapping("/{id}")
    public Car getCarById(@PathVariable("id") @Min(1) Long id) {
        Car car = findCarById(id, "Lekérdezési hiba. Az ID=" + id + " autó nem található.");
        //if (car == null) throw new CarNotFoundException("Az ID=" + id + " autó nincs a listában.");
        logInfo.info("Autó lekérdezve: ID={}; '{} {} ({})'", car.getId(), car.getBrand(), car.getModel(), car.getYear());
        return car;
    }

    @PostMapping
    public ResponseEntity<List<Car>> createCar(@RequestBody @Valid Car car) {
        //List<?> carData = Arrays.asList(car.getBrand(), car.getModel(), car.getYear());
        //if (carData.contains(null)) throw new IllegalArgumentException("Hiányzó autóadatok.");
        car.setId(generateCarId());
        carList.add(car);
        logInfo.info("Autó létrehozva: ID={}; '{} {} ({})'", car.getId(), car.getBrand(), car.getModel(), car.getYear());
        return ResponseEntity.status(HttpStatus.CREATED).body(carList);
    }

    private Long generateCarId()
    {
        // Klasszikus módszer
        /*Long maxId = 0L;
        for (Car car : carList)
        {
            if (car.getId() > maxId) maxId = car.getId();
        }
        return maxId + 1;*/

        // Modern módszer
        return carList.stream().mapToLong(Car::getId).max().orElse(0) + 1;
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateCar(@PathVariable("id") @Min(1) Long id, @RequestBody @Valid Car updatedCar) {
        Car car = findCarById(id, "Frissítési hiba. Az ID=" + id + " autó nem található.");
        //if (car == null) throw new CarNotFoundException("Az ID=" + id + " autó nincs a listában.");
        logInfo.info("Autó módosítása folyamatban: ID={}; '{} {} ({})'", car.getId(), car.getBrand(), car.getModel(), car.getYear());
        car.setBrand(updatedCar.getBrand());
        car.setModel(updatedCar.getModel());
        car.setYear(updatedCar.getYear());
        logInfo.info("Az ID={} autó módosítva: '{} {} ({})'", car.getId(), car.getBrand(), car.getModel(), car.getYear());
        return ResponseEntity.ok("Az ID=" + id + " autó sikeresen módosítva.");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCar(@PathVariable("id") @Min(1) Long id) {
        Car car = findCarById(id, "Törlési hiba. Az ID=" + id + " autó nem található.");
        //if (car == null) throw new CarNotFoundException("Az ID=" + id + " autó nincs a listában.");
        carList.remove(car);
        logInfo.info("Autó törölve: ID={}; '{} {} ({})'", car.getId(), car.getBrand(), car.getModel(), car.getYear());
        return ResponseEntity.ok("Az ID=" + id + " autó sikeresen törölve.");
    }

    // Régi verzió
    /*private Car findCarById(Long id) {
        return carList.stream().filter(car -> car.getId().equals(id)).findFirst().orElse(null);
    }*/

    // Új verzió
    private Car findCarById(Long id, String errorMessage) {
        return carList.stream().filter(car -> car.getId().equals(id)).findFirst().orElseThrow(() -> {
           logError.error(errorMessage);
           return new CarNotFoundException(errorMessage);
        });
    }

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

    // Kivétel kezelése CarNotFoundException esetén
    /*@ExceptionHandler(CarNotFoundException.class)
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
    }*/
}
