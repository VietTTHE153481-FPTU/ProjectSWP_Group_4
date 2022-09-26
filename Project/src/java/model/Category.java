/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class Category {
    int CategoryID; 
    String CategoryName;
    String CategoryImgURL;

    public Category() {
    }

    public Category(int CategoryID, String CategoryName, String CategoryImgURL) {
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
        this.CategoryImgURL = CategoryImgURL;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getCategoryImgURL() {
        return CategoryImgURL;
    }

    public void setCategoryImgURL(String CategoryImgURL) {
        this.CategoryImgURL = CategoryImgURL;
    }

    
}
