package com.secondhandcar.secondhandcar.services;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.secondhandcar.secondhandcar.SecondHandCar;
import com.secondhandcar.secondhandcar.exceptions.NoPre2010CarsException;

@Repository
public class SecondHandCarServiceImpl implements SecondHandCarService{
    public static ArrayList<SecondHandCar> cars;


    @Override
    public void addCar(SecondHandCar car) {
        cars.add(car);
    }

    @Override
    public void deleteCar(Integer id) {
        for(int i = 0; i < cars.size(); i++){
            if(cars.get(i).getId() == id){
                cars.remove(i);
                break;
            }
        }
    }

    @Override
    public void updateCar(Integer id, SecondHandCar car) {
        for(int i = 0; i < cars.size(); i++){
            if(cars.get(i).getId() == id){
                cars.set(i, car);
                break;
            }
        }
    }

    @Override
    public ArrayList<SecondHandCar> listCars() {
        return cars;
    }

    @Override
    public ArrayList<SecondHandCar> listCarsPre2010() {
        ArrayList<SecondHandCar> pre2010cars = new ArrayList<>();
        for(int i = 0; i < cars.size(); i++){
            if(cars.get(i).getYear() < 2010){
                pre2010cars.add(cars.get(i));
            }
        }
        try {
            if(pre2010cars.size() == 0){
                throw new NoPre2010CarsException("Nincs 2010 előtti gyártású autó.");
            }
        } catch (NoPre2010CarsException e) {
            e.getMessage();
        }
        return pre2010cars;
    }

    @Override
    public Integer averagePrice() {
        Integer avg = 0;
        for(int i = 0; i < cars.size(); i++){
            avg += cars.get(i).getPrice();
        }
        return avg / cars.size();
    }

    @Override
    public ArrayList<SecondHandCar> listLessThanThree() {
        ArrayList<SecondHandCar> lessThanThrees = new ArrayList<>();
        for(int i = 0; i < cars.size(); i++){
            if(cars.get(i).getQuantity() < 3){
                lessThanThrees.add(cars.get(i));
            }
        }
        return lessThanThrees;
    }
    
}
