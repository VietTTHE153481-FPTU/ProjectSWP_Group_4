/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author trung
 */
public class ProductDetail {

    int productID;
    String productName;
    String desc;
    double originPrice;
    double sellPrice;
    double salePercent;
    int subCateID;
    int sellerID;
    int amount;
    int statusID;
    int brandID;
    List<String> images;

    public ProductDetail() {
    }

    public ProductDetail(int productID, String productName, String desc, double originPrice, double sellPrice, double salePercent, int subCateID, int sellerID, int amount, int statusID, int brandID, List<String> images) {
        this.productID = productID;
        this.productName = productName;
        this.desc = desc;
        this.originPrice = originPrice;
        this.sellPrice = sellPrice;
        this.salePercent = salePercent;
        this.subCateID = subCateID;
        this.sellerID = sellerID;
        this.amount = amount;
        this.statusID = statusID;
        this.brandID = brandID;
        this.images = images;
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

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public double getOriginPrice() {
        return originPrice;
    }

    public void setOriginPrice(double originPrice) {
        this.originPrice = originPrice;
    }

    public double getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(double sellPrice) {
        this.sellPrice = sellPrice;
    }

    public double getSalePercent() {
        return salePercent;
    }

    public void setSalePercent(double salePercent) {
        this.salePercent = salePercent;
    }

    public int getSubCateID() {
        return subCateID;
    }

    public void setSubCateID(int subCateID) {
        this.subCateID = subCateID;
    }

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

}
