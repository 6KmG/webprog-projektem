package com.secondhandcar.secondhandcar;

import org.springframework.web.bind.annotation.RestController;

import com.secondhandcar.secondhandcar.exceptions.NoPre2010CarsException;
import com.secondhandcar.secondhandcar.services.SecondHandCarService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/")
@Validated

public class SecondHandCarController {

    @Autowired
    private SecondHandCarService secondHandCarService;

    @GetMapping("/add")
    public void addExampleCar() {
        addCar(new SecondHandCar("Renault", "Thalia", 2002, 600000, 2));
    }
    
    @PostMapping
    public ResponseEntity<SecondHandCar> addCar(@RequestBody SecondHandCar car) {
        secondHandCarService.addCar(car);
        return ResponseEntity.status(HttpStatus.CREATED).body(car);
    }

    public void deleteCar(Integer id) {
        secondHandCarService.deleteCar(id);
    }

    public void updateCar(Integer id, SecondHandCar car) {
        secondHandCarService.updateCar(id, car);
    }
    
    @GetMapping("/cars")
    public ArrayList<SecondHandCar> listCars() {
        return secondHandCarService.listCars();
    }

    public ArrayList<SecondHandCar> listCarsPre2010() throws NoPre2010CarsException {
        return secondHandCarService.listCarsPre2010();
    }

    public Integer averagePrice() {
        return secondHandCarService.averagePrice();
    }

    public ArrayList<SecondHandCar> listLessThanThree() {
        return secondHandCarService.listLessThanThree();
    }

    
    
}
