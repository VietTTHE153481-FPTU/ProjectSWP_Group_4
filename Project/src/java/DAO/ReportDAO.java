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

    public void addReport(int id) {
        String sql = "INSERT INTO [dbo].[Favorite_Product] ([UserID], [ProductID]) VALUES(?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }
}
