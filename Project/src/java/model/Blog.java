/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class Blog {
    int id;
    String author;
    int day;
    String month;
    int year;
    String BlogTitle;
    String BlogContent;
    String imageLink;

    public Blog() {
    }

    public Blog(int id, String author, int day, String month, int year, String BlogTitle, String BlogContent, String imageLink) {
        this.id = id;
        this.author = author;
        this.day = day;
        this.month = month;
        this.year = year;
        this.BlogTitle = BlogTitle;
        this.BlogContent = BlogContent;
        this.imageLink = imageLink;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getBlogTitle() {
        return BlogTitle;
    }

    public void setBlogTitle(String BlogTitle) {
        this.BlogTitle = BlogTitle;
    }

    public String getBlogContent() {
        return BlogContent;
    }

    public void setBlogContent(String BlogContent) {
        this.BlogContent = BlogContent;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
}
