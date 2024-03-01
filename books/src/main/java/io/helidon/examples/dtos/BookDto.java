package io.helidon.examples.dtos;

import io.helidon.examples.db.Books;

import java.math.BigDecimal;

public class BookDto {
    private Integer id;
    private String isbn;
    private String title;
    private BigDecimal price;
    private String authorName;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public static BookDto from(Books obj) {
        BookDto ret = new BookDto();

        ret.setId(obj.getId());
        ret.setIsbn(obj.getIsbn());
        ret.setPrice(obj.getPrice());
        ret.setTitle(obj.getTitle());

        return ret;
    }
}
