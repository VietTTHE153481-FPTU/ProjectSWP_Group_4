/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minhm
 */
public class Cart {

    private List<item> hold;
    private double total;

    public Cart() {
        this.hold = new ArrayList<>();
    }

    private item search(item a) {
        for (item i : hold) {
            if (i.getItem_product().getProductID() == a.getItem_product().getProductID()) {
                return i;
            }
        }
        return null;
    }

    public List<item> getListItem() {
        return hold;
    }

    public void addItem(item a) {
        if (search(a) != null) {
            item mid = search(a);
            if (a.getNumO() == -1 && mid.getNumO() == 1) {
                remove(mid.getItem_product().getProductID());
                return;
            } else {
                mid.setNumO(a.getNumO() + mid.getNumO());
            }

        } else {
            hold.add(a);
        }
    }

//    if (search(a) != null) {
//            item m = search(a);
//            m.setQuant(m.getQuant() + a.getQuant());
//        } else {
//            list.add(a);
//        }
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
            double a = i.getNumO() * i.getItem_product().getSellPrice();
            t += (double) a;
        }
        return t;
    }

    public int Size() {
        return this.hold.size();
    }

    public String FormatPrice(double p) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String format = formatter.format(p).toString();
        return format;
    }
}
