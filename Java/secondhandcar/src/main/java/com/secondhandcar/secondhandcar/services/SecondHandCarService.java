package com.secondhandcar.secondhandcar.services;

import java.util.ArrayList;

import com.secondhandcar.secondhandcar.SecondHandCar;
import com.secondhandcar.secondhandcar.exceptions.NoPre2010CarsException;

public interface SecondHandCarService {
    public void addCar(SecondHandCar car);

    public void deleteCar(Integer id);

    public void updateCar(Integer id, SecondHandCar car);

    public ArrayList<SecondHandCar> listCars();
    
    public ArrayList<SecondHandCar> listCarsPre2010() throws NoPre2010CarsException;

    public Integer averagePrice();

    public ArrayList<SecondHandCar> listLessThanThree();
}
