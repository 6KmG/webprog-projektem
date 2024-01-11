package com.bookshop.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.bookshop.api.model.Book;
import com.bookshop.api.model.OwnedBook;
import com.bookshop.api.repository.OwnedBookRepository;

import java.util.List;

@Service
public class OwnedBookServiceImpl implements OwnedBookService{
    @Autowired
    OwnedBookRepository ownedBookRepository;
    @Override
    public List<Book> getAllBooks() {
        return ownedBookRepository.findAll().stream().map(OwnedBook::getBook).toList();
    }

    @Override
    public Book saveBook(Book book) {
        OwnedBook ownedBook=new OwnedBook();
        ownedBook.setId(book.getId());
        ownedBook.setTitle(book.getTitle());
        ownedBook.setAuthor(book.getAuthor());
        ownedBook.setPrice(book.getPrice());
        ownedBookRepository.save(ownedBook);
        return book;
    }

    @Override
    public void delBook(Long id) {
        ownedBookRepository.deleteById(id);
    }
}
