package com.bookshop.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookshop.api.model.OwnedBook;
@Repository
public interface OwnedBookRepository extends JpaRepository<OwnedBook, Long> {
}
