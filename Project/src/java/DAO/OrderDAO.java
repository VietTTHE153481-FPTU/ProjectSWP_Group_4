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
import model.Users;

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

    public Order getOrderByOrderID(int orderID) {
        String sql = "select o.ID , o.UserID , o.TotalPrice , o.Note , o.Status , o.Date , d.Order_ID , d.ProductID , d.ProductName  ,d.ProductPrice , d.Quantity from Orders o\n"
                + "join Order_Detail d on d.Order_ID = o.ID\n"
                + "where o.ID = ?  ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));

            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int getTotalOrders() {
        String sql = "SELECT count (*) FROM [Orders]";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return total = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void upDateOrderStatus(String note, String status, int id) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [Note] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE ID = ?";
        int statusID = Integer.parseInt(status);
//        String[] statusIDLIST = {"Waiting for Confirmation", "Packaging", "Delivering", "Canceled", "Completed"};
//        for (int i = 0; i < statusIDLIST.length; i++) {
//            if (statusIDLIST[i].equalsIgnoreCase(status)) {
//                statusID = i + 1;
//                break;
//            }
//        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, note);
            ps.setInt(2, statusID);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void DelOrder(int orderID) {
        String sql = "delete from Order_Detail \n"
                + "where Order_ID = ?\n"
                + "delete from Feedback\n"
                + "where OrderID = ?\n"
                + "delete from ShipInfo\n"
                + "where Order_ID = ?\n"
                + "delete Orders\n"
                + "where ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ps.setInt(2, orderID);
            ps.setInt(3, orderID);
            ps.setInt(4, orderID);
            ps.executeUpdate();
        } catch (Exception ex) {

        }
    }

    public List<Order> getAllByShopID(int id) {
        String sql = "select a.ID as OrderID, a.UserID,a.TotalPrice,a.Note,d.Name as StatusName,a.Date as Date\n"
                + "from Orders as a,Order_Detail as b, Product as c, Order_Status as d \n"
                + "where a.ID = b.Order_ID and b.ProductID = c.ProductID and c.ShopID = ? and d.ID = a.Status";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("OrderID"), rs.getInt("UserID"), rs.getInt("TotalPrice"), rs.getString("Note"), rs.getString("StatusName"), rs.getDate("Date")));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        od.upDateOrderStatus("byeeeeeeeeee", "2", 1);

    }
}
