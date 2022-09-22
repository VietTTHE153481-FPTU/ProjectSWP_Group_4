/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class ProductDetailImg {

    int productID;
    String productImgURL;
    String fullImg;
    String topImg;
    String bottomImg;
    String otherImg;

    public ProductDetailImg() {
    }

    public ProductDetailImg(int productID, String productImgURL, String fullImg, String topImg, String bottomImg, String otherImg) {
        this.productID = productID;
        this.productImgURL = productImgURL;
        this.fullImg = fullImg;
        this.topImg = topImg;
        this.bottomImg = bottomImg;
        this.otherImg = otherImg;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductImgURL() {
        return productImgURL;
    }

    public void setProductImgURL(String productImgURL) {
        this.productImgURL = productImgURL;
    }

    public String getFullImg() {
        return fullImg;
    }

    public void setFullImg(String fullImg) {
        this.fullImg = fullImg;
    }

    public String getTopImg() {
        return topImg;
    }

    public void setTopImg(String topImg) {
        this.topImg = topImg;
    }

    public String getBottomImg() {
        return bottomImg;
    }

    public void setBottomImg(String bottomImg) {
        this.bottomImg = bottomImg;
    }

    public String getOtherImg() {
        return otherImg;
    }

    public void setOtherImg(String otherImg) {
        this.otherImg = otherImg;
    }
    
    
}
