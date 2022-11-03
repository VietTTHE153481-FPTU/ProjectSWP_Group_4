/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class FeedbackDAO extends DBContext{
    public void insertFeedback(int userid,  int productid, int orderid, int star, String review){
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
    
    public int findOrderIdByProductId(int pid){
        String sql = "select top 1 od.Order_ID from Order_Detail od, Product p where p.ProductID = od.ProductID and p.ProductID=? order by od.Order_ID desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }
    
    
    public static void main(String[] args) {
        FeedbackDAO fb = new FeedbackDAO();
//        fb.insertFeedback(1, 1, 2, 5, "good");
           System.out.println(fb.findOrderIdByProductId(2));
    }
}
