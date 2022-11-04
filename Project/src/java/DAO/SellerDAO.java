/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderSeller;
import model.Products;

/**
 *
 * @author Admin
 */
public class SellerDAO extends DBContext {

    public int countTotalProductBySeller(int id) {
        try {
            String sql = "select sum(p.Amount) from Product p where p.ShopID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int countTotalCustomerBySeller(int id) {
        try {
            String sql = "select count(distinct o.UserID) from Orders o ,  Order_Detail od, Product p where o.ID = od.Order_ID and p.ProductID=od.ProductID and p.ShopID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int countTotalOrderBySeller(int id) {
        try {
            String sql = "select count(distinct od.Order_ID) from Order_Detail od, Product p where od.ProductID = p.ProductID and p.ShopID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public List<OrderSeller> getAllProductOrderBySeller(int id) {
        List<OrderSeller> list = new ArrayList<>();
        String sql = "select distinct o.ID, od.ProductName,od.ProductPrice,o.Status, o.Date, od.Quantity from Orders o, Order_Detail od, Product p, Order_Status os where p.ShopID = ? and o.ID = od.Order_ID and p.ProductID = od.ProductID";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderSeller os = OrderSeller.builder()
                        .orderID(rs.getInt(1)).
                        productName(rs.getString(2)).
                        productPrice(rs.getInt(3)).
                        status(rs.getInt(4)).
                        date(rs.getDate(5)).
                        quantity(rs.getInt(6))
                        .build();
                list.add(os);
              }
          } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        SellerDAO sd = new SellerDAO();
        List<OrderSeller> list = sd.getAllProductOrderBySeller(1);
        for (OrderSeller o : list) {
            System.out.println(o);
        }
//        System.out.println(sd.countTotalProductBySeller(1));
      
    }
}
