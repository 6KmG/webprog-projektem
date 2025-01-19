package com.bookstore.webapp.Models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "my_books")
@Setter
@Getter
public class MyBook {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // @ManyToOne
    // @JoinColumn(name = "book_id", referencedColumnName = "id", insertable = false, updatable = false)
    // private Book book;

    @ManyToOne
    @JoinColumn(name = "book_id", referencedColumnName = "id", nullable = false, unique = true) // Removed insertable = false, updatable = false
    private Book book;
}
