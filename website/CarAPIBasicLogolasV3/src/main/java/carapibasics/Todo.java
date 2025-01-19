package carapibasics;

import jakarta.validation.constraints.NotBlank;

// Az autó, mint objektum, tartalmazza a szükséges mezőket: id, brand, mode, year
public class Todo {
    private Long id;
    @NotBlank(message = "Hibás feladat név: a 'name' mező nem lehet üres.")
    private String name;
    @NotBlank(message = "Hibás feladat leítás: a 'description' mező nem lehet üres.")
    private String description;
    @NotBlank(message = "Hibás dátum: a 'date' mező nem lehet üres.")
    private String date;
    @NotBlank(message = "Hibás prioritás: a 'priority' mező nem lehet üres.")
    private Integer priority;
    @NotBlank(message = "Hibás felhasználónév: a 'userName' mező nem lehet üres.")
    private String userName;

    // public Todo(Long id, String brand, String model, Integer year) {
    //     this.id = id;
    //     this.brand = brand;
    //     this.model = model;
    //     this.year = year;
    // }

    
    
    // public Todo(@NotBlank(message = "Hibás feladat név: a 'name' mező nem lehet üres.") String name,
    //         @NotBlank(message = "Hibás feladat leítás: a 'description' mező nem lehet üres.") String description,
    //         @NotBlank(message = "Hibás dátum: a 'date' mező nem lehet üres.") String date,
    //         @NotBlank(message = "Hibás prioritás: a 'priority' mező nem lehet üres.") Integer priority,
    //         @NotBlank(message = "Hibás felhasználónév: a 'userName' mező nem lehet üres.") String userName) {
    //     this.name = name;
    //     this.description = description;
    //     this.date = date;
    //     this.priority = priority;
    //     this.userName = userName;
    // }

    public Todo(String name, String description, String date, Integer priority, String userName) {
        this.name = name;
        this.description = description;
        this.date = date;
        this.priority = priority;
        this.userName = userName;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    // public Long getId() {
    //     return id;
    // }

    // public void setId(Long id) {
    //     this.id = id;
    // }

    // public String getBrand() {
    //     return brand;
    // }

    // public void setBrand(String brand) {
    //     this.brand = brand;
    // }

    // public String getModel() {
    //     return model;
    // }

    // public void setModel(String model) {
    //     this.model = model;
    // }

    // public Integer getYear() {
    //     return year;
    // }

    // public void setYear(Integer year) {
    //     this.year = year;
    // }

    
}
