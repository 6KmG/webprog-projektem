package com.bookshop.api.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "books")
@Getter
@Setter
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "title", nullable = false)
    @NotEmpty(message = "Hiba a 'title' mezőben. A mező nem lehet üres.")
    private String title;
    @Column(name = "author", nullable = false)
    @NotEmpty(message = "Hiba az 'author' mezőben. A mező nem lehet üres.")
    private String author;
    @Column(name = "price", nullable = false)
    @NotNull
    @Min(value = 0, message = "Nem fizetünk azért hogy elvigyenek egy könyvet!")
    private Integer price;
    @Column(name = "available", nullable = false)
    @NotNull
    private Boolean available;

}
