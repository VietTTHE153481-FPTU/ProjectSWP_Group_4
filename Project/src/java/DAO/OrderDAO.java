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
import model.Order;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public List<Order> getOrderByUserID(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.ID, os.Name, o.TotalPrice, o.Date\n"
                + "FROM Orders o  INNER JOIN Order_Status os\n"
                + "ON o.Status = os.ID\n"
                + "WHERE o.UserId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        List<Order> orders = od.getOrderByUserID(5);
        System.out.println(orders);
    }
}
