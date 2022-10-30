/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author trung
 */
public class Products extends Shop {

    int productID;
    String productName;
    String Description;
    double OriginalPrice;
    double SellPrice;
    double SalePercent;
    int SubCategoryID;
    int ShopID;
    String ShopName;
    int Amount;
    int StatusID;
    String url;
    int CategoryID;

    public Products() {
    }

    public Products(int productID, String productName, String Description, double OriginalPrice, double SellPrice, double SalePercent, int SubCategoryID, int ShopID, String ShopName, int Amount, int StatusID, String url, int CategoryID) {
        this.productID = productID;
        this.productName = productName;
        this.Description = Description;
        this.OriginalPrice = OriginalPrice;
        this.SellPrice = SellPrice;
        this.SalePercent = SalePercent;
        this.SubCategoryID = SubCategoryID;
        this.ShopID = ShopID;
        this.ShopName = ShopName;
        this.Amount = Amount;
        this.StatusID = StatusID;
        this.url = url;
        this.CategoryID = CategoryID;
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

    public int getShopID() {
        return ShopID;
    }

    public void setShopID(int ShopID) {
        this.ShopID = ShopID;
    }

    @Override
    public String getShopName() {
        return ShopName;
    }

    @Override
    public void setShopName(String ShopName) {
        this.ShopName = ShopName;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String FormatPrice(double p) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String format = formatter.format(p).toString();
        return format;
    }
}
