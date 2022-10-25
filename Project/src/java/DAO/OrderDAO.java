/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.Users;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext{

    public List<Order> getOrderByUsserID(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "Select ID,Status,TotalPrice,Date from Orders where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
               // list.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4)));
            Order o1 = new Order();
            o1.setId(rs.getInt("ID"));
            o1.setStatus(rs.getString("Status"));
            o1.setTotalPrice(rs.getDouble("TotalPrice"));
            o1.setDate(rs.getDate("Date"));
            list.add(o1);
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        OrderDAO order = new OrderDAO();
        List<Order> orders = order.getOrderByUsserID(4);
        System.out.println(orders);
    }
}
