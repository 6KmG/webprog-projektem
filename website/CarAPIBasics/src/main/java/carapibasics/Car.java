package carapibasics;

import org.hibernate.validator.constraints.Range;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class Car {
    private Long id;
    @NotBlank(message = "Hibás márka: a 'brand' mező nem lehet üres.")
    private String brand;
    @NotBlank(message = "Hibás modell: a 'model' mező nem lehet üres.")
    private String model;
    @NotNull(message = "Hibás évszám: a 'year' mezőt kötelező megadni és nem lehet üres")
    @Range(min = 1900, max = 2100)
    private Integer year;

    public Car() {
    }

    public Car(Long id, String brand, String model, Integer year) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.year = year;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
}
