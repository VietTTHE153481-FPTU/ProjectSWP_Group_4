/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minhm
 */
public class Cart {

    public List<item> hold;
    public double total;

    public Cart() {
        this.hold = new ArrayList<>();
    }
    private item search(item a){
        for(item i: hold){
            if(i.getItem_product().getProductID()==a.getItem_product().getProductID()){
                return i;
            }
        }
        return null;
    }
    public List<item> getListItem(){
        return this.hold;
    }
    public void addItem(item a){
        if(search(a)!=null){
            item mid = search(a);
            mid.setNumO(a.getNumO()+mid.getNumO());
        }else {
            hold.add(a);
        }
    }
    public void remove(int id) {
        for (item i : hold) {
            if (i.getItem_product().getProductID() == id) {
                hold.remove(i);
                return;
            }
        }
    }
    public double totalmoney() {
        double t = 0;
        for (item i : hold) {
            double a = i.getNumO()* i.getItem_product().getSellPrice();
            t += (double) a;
        }
        return t;
    }
    public int Size(){
        return this.hold.size();
    }
}


