/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class Product {
    int productID;
    String productName; 
    String Description;
    double OriginalPrice; 
    double SellPrice; 
    double SalePercent; 
    int SubCategoryID; 
    int SellerID; 
    int Amount; 
    int StatusID; 
    int BrandID;
    String url;

    public Product() {
    }

    public Product(int productID, String productName, String Description, double OriginalPrice, double SellPrice, double SalePercent, int SubCategoryID, int SellerID, int Amount, int StatusID, int BrandID, String url) {
        this.productID = productID;
        this.productName = productName;
        this.Description = Description;
        this.OriginalPrice = OriginalPrice;
        this.SellPrice = SellPrice;
        this.SalePercent = SalePercent;
        this.SubCategoryID = SubCategoryID;
        this.SellerID = SellerID;
        this.Amount = Amount;
        this.StatusID = StatusID;
        this.BrandID = BrandID;
        this.url = url;
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

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public double getOriginalPrice() {
        return OriginalPrice;
    }

    public void setOriginalPrice(double OriginalPrice) {
        this.OriginalPrice = OriginalPrice;
    }

    public double getSellPrice() {
        return SellPrice;
    }

    public void setSellPrice(double SellPrice) {
        this.SellPrice = SellPrice;
    }

    public double getSalePercent() {
        return SalePercent;
    }

    public void setSalePercent(double SalePercent) {
        this.SalePercent = SalePercent;
    }

    public int getSubCategoryID() {
        return SubCategoryID;
    }

    public void setSubCategoryID(int SubCategoryID) {
        this.SubCategoryID = SubCategoryID;
    }

    public int getSellerID() {
        return SellerID;
    }

    public void setSellerID(int SellerID) {
        this.SellerID = SellerID;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int Amount) {
        this.Amount = Amount;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
