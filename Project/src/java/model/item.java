/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Minhm
 */
public class item {

    public Products item_product;
    public int numO;

    public item() {

    }

    public item(Products p, int num) {
        this.item_product = p;
        this.numO = num;
    }

    public Products getItem_product() {
        return item_product;
    }

    public void setItem_product(Products item_product) {
        this.item_product = item_product;
    }

    public int getNumO() {
        return numO;
    }

    public void setNumO(int numO) {
        this.numO = numO;
    }

}
