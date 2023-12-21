package com.secondhandcar.secondhandcar;

import com.secondhandcar.secondhandcar.services.SecondHandCarServiceImpl;

public class SecondHandCar {
    private Integer id;
    private String brand;
    private String model;
    private Integer year;
    private Integer price;
    private Integer quantity;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }
    public Integer getYear() {
        return year;
    }
    public void setYear(Integer year) {
        this.year = year;
    }
    public Integer getPrice() {
        return price;
    }
    public void setPrice(Integer price) {
        this.price = price;
    }
    public Integer getQuantity() {
        return quantity;
    }
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    public SecondHandCar(String brand, String model, Integer year, Integer price, Integer quantity) {
        this.id = SecondHandCarServiceImpl.cars.size();
        this.brand = brand;
        this.model = model;
        this.year = year;
        this.price = price;
        this.quantity = quantity;
    }

}
