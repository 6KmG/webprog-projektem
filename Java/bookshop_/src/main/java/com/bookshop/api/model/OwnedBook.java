package com.bookshop.api.model;

import jakarta.persistence.*;
import lombok.Getter;

@Entity
@Table(name = "ownedBooks")
public class OwnedBook {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String author;
    private Integer price;

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Book getBook(){
        Book current = new Book();
        current.setId(id);
        current.setTitle(title);
        current.setAuthor(author);
        current.setPrice(price);
        current.setAvailable(true);
        return current;
    }
}
