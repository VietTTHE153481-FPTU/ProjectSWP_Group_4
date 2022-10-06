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
    String title;
    String content;
    String imageLink;

    public Blog() {
    }

    public Blog(int id, String author, int day, String month, int year, String title, String content, String imageLink) {
        this.id = id;
        this.author = author;
        this.day = day;
        this.month = month;
        this.year = year;
        this.title = title;
        this.content = content;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", author=" + author + ", day=" + day + ", month=" + month + ", year=" + year + ", title=" + title + ", content=" + content + ", imageLink=" + imageLink + '}';
    }
}
