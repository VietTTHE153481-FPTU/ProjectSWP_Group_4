/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Minhm
 */
public class Messages {
    private int id;
    private int by_user;
    private String username;
    private String message;
    private String date;

    public Messages(int id,int by_user, String message, String date, String username) {
        this.by_user = by_user;
        this.message = message;
        this.date = date;
        this.id = id;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Messages() {
    }

    public int getBy_user() {
        return by_user;
    }

    public void setBy_user(int by_user) {
        this.by_user = by_user;
    }

//    public int getIn_group() {
//        return in_group;
//    }
//
//    public void setIn_group(int in_group) {
//        this.in_group = in_group;
//    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
