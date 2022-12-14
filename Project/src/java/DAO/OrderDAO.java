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

    public int getUserByOrderID(int ID) {
        String sql = "select UserID from Orders\n"
                + "where ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt("UserID");
            }
        } catch (Exception e) {
        }
        return -1;
    }

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

    public int[] getStatis() {
        int[] endarr = {0, 0, 0, 0, 0};
        String sql = "select distinct a.ID as OrderID, a.UserID,a.TotalPrice,a.Note,d.Name as StatusName,a.Date as Date\n"
                + "                from Orders as a,Order_Detail as b, Product as c, Order_Status as d\n"
                + "                where a.ID = b.Order_ID and b.ProductID = c.ProductID  and d.ID = a.Status";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString("StatusName").equalsIgnoreCase("Waiting for Confirmation")) {
                    endarr[0] += 1;
                } else if (rs.getString("StatusName").equalsIgnoreCase("Packaging")) {
                    endarr[1] += 1;
                } else if (rs.getString("StatusName").equalsIgnoreCase("Delivering")) {
                    endarr[2] += 1;
                } else if (rs.getString("StatusName").equalsIgnoreCase("Canceled")) {
                    endarr[3] += 1;
                } else {
                    endarr[4] += 1;
                }
            }
        } catch (Exception ex) {

        }
        return endarr;
    }

    public List<Order> getAllByShopID(int id) {
        String sql = "select distinct a.ID as OrderID, a.UserID,a.TotalPrice,a.Note,d.Name as StatusName,a.Date as Date\n"
                + "from Orders as a,Order_Detail as b, Product as c, Order_Status as d\n"
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

    public void createOrder(Order o) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([UserID]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[Note]\n"
                + "           ,[Status]\n"
                + "           ,[Date])\n"
                + "     VALUES\n"
                + "           (?,?,?,1,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getUserId());
            st.setDouble(2, o.getTotalPrice());
            st.setString(3, o.getNote());
            st.setString(4, o.getDate());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public Order getCheckOutOrder(int id) {
        String sql = "SELECT TOP(1)   Order_Status.Name, Orders.ID, Orders.UserID, Orders.TotalPrice, Orders.Note, Orders.Date\n"
                + "FROM            Order_Status INNER JOIN\n"
                + "                         Orders ON Order_Status.ID = Orders.Status\n"
                + "WHERE UserID=?\n"
                + "  ORDER BY Date DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Order(
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(1),
                        rs.getDate(6)
                );

            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void ReqCancelOrder(int id){
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [Status] = 4\n"
                + " WHERE ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    public void CancelOrder(int id) {
        String sql1 = "DELETE FROM Order_Detail\n"
                + "      WHERE Order_ID = ?";
        String sql2 = "DELETE FROM ShipInfo\n"
                + "      WHERE Order_ID = ?";
        String sql = "DELETE FROM Orders\n"
                + "      WHERE ID = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, id);
            st1.executeUpdate();
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<Order> a = dao.getAllByShopID(1);
        for (Order b : a) {
            System.out.println(b.getStatus());
        }
    }
}
