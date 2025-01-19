package com.bookstore.webapp.Models;

import java.time.LocalDateTime;

import org.hibernate.validator.constraints.Range;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "books")
@EntityListeners(AuditingEntityListener.class)
@Setter
@Getter
@NoArgsConstructor // Kötelező az üres konstruktor a JPA miatt
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title", nullable = false)
    @NotEmpty(message = "Hibás cím: a 'title' mező nem lehet üres.")
    private String title;

    @Column(name = "author", nullable = false)
    @NotEmpty(message = "Hibás szerző: az 'author' mező nem lehet üres.")
    private String author;

    @Column(name = "year", nullable = false)
    @NotNull(message = "Hibás évszám: a 'year' mező nem lehet üres.")
    @Range(min = 1900, max = 2100, message = "Hibás évszám: a 'year' {min} és {max} értékek között kell lennie.")
    private Integer year;

    @Column(name = "price", nullable = false)
    @NotNull(message = "Az 'price' mező nem lehet üres.")
    private Integer price;

    @Column(name = "available", nullable = false)
    private boolean available;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @CreatedDate
    @Column(name = "created_date", updatable = false)
    private LocalDateTime createdDate;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @LastModifiedDate
    @Column(name = "last_modified_date")
    private LocalDateTime lastModifiedDate;

    // Új konstruktor
    public Book(String title, String author, int year, int price, boolean available) {
        this.title = title;
        this.author = author;
        this.year = year;
        this.price = price;
        this.available = available;
    }
}
