/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author Admin
 */
public class Order extends OrderDetail {

    private int id;
    private int userId;
    private double totalPrice;
    private String note;
    private String status;
    private Date date;
    private String username;

    public void setUsername(String username){
        this.username = username;
    }
    public String getUsername(){
        return this.username;
    }
    public Order() {
    }

    public Order(int userId, double totalPrice, String note) {
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.note = note;
    }

    public Order(int id, int userId, double totalPrice, String note, String status, Date date) {
        this.id = id;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.note = note;
        this.status = status;
        this.date = date;
    }

    public Order(int id, int userId, double totalPrice, String note, String status, Date date, int orderID, int productID, String productName, double productPrice, int quantity) {
        super(orderID, productID, productName, productPrice, quantity);
        this.id = id;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.note = note;
        this.status = status;
        this.date = date;
    }

    public Order(int id, String status, double totalPrice, Date date) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.status = status;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
        return df.format(date);
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
