/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class Comment {

    int ID;
    int BlogID;
    int UserID;
    String Comment;

    public Comment() {
    }

    public Comment(int ID, int BlogID, int UserID, String Comment) {
        this.ID = ID;
        this.BlogID = BlogID;
        this.UserID = UserID;
        this.Comment = Comment;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getBlogID() {
        return BlogID;
    }

    public void setBlogID(int BlogID) {
        this.BlogID = BlogID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }

}
