/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO extends DBContext {

    public List<OrderDetail> getOdByOrderId(int OrderId) {
        List<OrderDetail> od = new ArrayList<>();
        String sql = "select o.ProductID, o.ProductName, p.ProductImgURL, o.ProductPrice, o.Quantity\n"
                + "from Order_Detail o inner join ProductImg p\n"
                + "on o.ProductID=p.ProductID\n"
                + "where o.Order_ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, OrderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                od.add(new OrderDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
            }

        } catch (Exception ex) {
            System.out.println("Error" + ex);
        }
        return od;
    }

    public List<OrderDetail> getDetailByOrderId(int OrderId) {
        List<OrderDetail> od = new ArrayList<>();
        String sql = " select o.Order_ID ,o.ProductID, o.ProductName, o.ProductPrice, o.Quantity\n"
                + "                from Order_Detail o inner join  Orders od\n"
                + "                on od.ID=o.Order_ID\n"
                + "                where o.Order_ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, OrderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                od.add(new OrderDetail(rs.getInt("Order_ID"), rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
        return od;
    }
    
    public static void main(String[] args) {
        OrderDetailDAO od = new OrderDetailDAO();
            List<OrderDetail> orderList = od.getOdByOrderId(5);
            
            int total=0;
            for (OrderDetail o : orderList) {
               total+=(o.getProductPrice()*o.getQuantity()); 
            }
            System.out.println(total);
            for (OrderDetail orderDetail : orderList) {
                System.out.println(orderDetail.getProductName());
        }
    }

}
