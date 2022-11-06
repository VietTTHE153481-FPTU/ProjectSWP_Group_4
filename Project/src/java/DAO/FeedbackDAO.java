/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import model.FeedbackReply;
import model.Order;
import model.Products;

/**
 *
 * @author Admin
 */
public class FeedbackDAO extends DBContext {

    public void insertFeedback(int userid, int productid, int orderid, int star, String review) {
        String sql = "insert into Feedback values(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, productid);
            ps.setInt(3, orderid);
            ps.setInt(4, star);
            ps.setString(5, review);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int findOrderIdByProductId(int pid) {
        String sql = "select top 1 od.Order_ID from Order_Detail od, Product p where p.ProductID = od.ProductID and p.ProductID=? order by od.Order_ID desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public List<Feedback> getFeedbackbyProductID(int productId) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT ID,UserID,ProductID,OrderID,Star,FeedbackDetail FROM Feedback";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setID(rs.getInt("ID"));
                f.setUserID(rs.getInt("UserID"));
                f.setProductID(rs.getInt("ProductID"));
                f.setOrderID(rs.getInt("OrderID"));
                f.setStar(rs.getInt("Star"));
                f.setFeedbackDetai(rs.getString("FeedbackDetail"));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println("error:" + e);
        }
        return list;
    }

    public Feedback getFeedbackByID(int id) {
        String sql = "SELECT       *\n"
                + "FROM            Feedback \n"
                + "WHERE        Feedback.ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6)
                );
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<FeedbackReply> getAllFeedbackReply() {
        List<FeedbackReply> list= new ArrayList<>();
        String sql = "select * from Feedback_Replies";
        try {
            PreparedStatement st = connection.prepareStatement(sql);            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                FeedbackReply fr= new FeedbackReply();
                fr.setId(rs.getInt(1));
                fr.setFeedbackID(rs.getInt(2));
                fr.setUserID(rs.getInt(3));
                fr.setProductID(rs.getInt(4));
                fr.setRepliesText(rs.getString(5));
                list.add(fr);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public void insertReply(FeedbackReply fr) {
        String sql = "INSERT INTO [dbo].[Feedback_Replies]\n"
                + "           ([FeedbackID]\n"
                + "           ,[UserID]\n"
                + "           ,[ProductID]\n"
                + "           ,[RepliesText])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, fr.getFeedbackID());
            st.setInt(2, fr.getUserID());
            st.setInt(3, fr.getProductID());
            st.setString(4, fr.getRepliesText());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) {
        FeedbackDAO fb = new FeedbackDAO();
        fb.insertFeedback(1, 1, 2, 5, "good");
//        List<Feedback> list = fb.getAllFeedback();
//        System.out.println(list.get(0));
    }
}
