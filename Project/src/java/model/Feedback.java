/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Feedback {
    int ID;
    int UserID;
    int ProductID;
    int OrderID;
    int Star;
    String FeedbackDetai;

    public Feedback() {
    }

    public Feedback(int ID, int UserID, int ProductID, int OrderID, int Star, String FeedbackDetai) {
        this.ID = ID;
        this.UserID = UserID;
        this.ProductID = ProductID;
        this.OrderID = OrderID;
        this.Star = Star;
        this.FeedbackDetai = FeedbackDetai;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getStar() {
        return Star;
    }

    public void setStar(int Star) {
        this.Star = Star;
    }

    public String getFeedbackDetai() {
        return FeedbackDetai;
    }

    public void setFeedbackDetai(String FeedbackDetai) {
        this.FeedbackDetai = FeedbackDetai;
    }

    @Override
    public String toString() {
        return "Feedback{" + "ID=" + ID + ", UserID=" + UserID + ", ProductID=" + ProductID + ", OrderID=" + OrderID + ", Star=" + Star + ", FeedbackDetai=" + FeedbackDetai + '}';
    }
    
    
}
