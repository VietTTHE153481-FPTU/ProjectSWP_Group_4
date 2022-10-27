/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author trung
 */
@Setter
@Getter
@ToString
@Builder
public class Blog {

    int id;
    int day;
    String month;
    int year;
    String title;
    String content;
    String imageLink;
    int authorId;

    public Blog() {
    }

    public Blog(int id, int day, String month, int year, String title, String content, String imageLink, int authorId) {
        this.id = id;
        this.day = day;
        this.month = month;
        this.year = year;
        this.title = title;
        this.content = content;
        this.imageLink = imageLink;
        this.authorId = authorId;
    }
}
