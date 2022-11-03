/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author trung
 */
public class ReportDAO extends DBContext {

    public void addReport(int id, String title, int inputShop, String content) {
        String sql = "INSERT INTO [dbo].[Report] ([UserID], [ReportTitle], [ShopID], [ReportContent], [Date])\n"
                + "VALUES (?, ?, ?, ?, getDATE())";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, title);
            st.setInt(3, inputShop);
            st.setString(4, content);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }
}
