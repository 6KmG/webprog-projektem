package com.todoapi.todoapi;

import jakarta.validation.constraints.NotBlank;

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
    
    public Todo(Long id, String name, String description, String date, Integer priority, String userName) {
        this.id = id;
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
}
