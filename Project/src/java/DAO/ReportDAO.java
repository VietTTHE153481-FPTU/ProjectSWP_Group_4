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
import model.Report;

/**
 *
 * @author trung
 */
public class ReportDAO extends DBContext {
    
    public List<Report> getAllReport() {
        List<Report> list = new ArrayList<>();
        String sql = "SELECT * FROM Report";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Report r = new Report();
                r.setReportId(rs.getInt("reportId"));
                r.setUserId(rs.getInt("UserId"));
                r.setReportTitle(rs.getString("ReportTitle"));
                r.setShopId(rs.getInt("ShopId"));
                r.setReportContent(rs.getString("ReportContent"));
                r.setDate(rs.getDate("Date"));
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
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
    
    public int countReport() {
        int a = 0;
        String sql = "SELECT COUNT(ReportID) AS Count FROM dbo.Report";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return a = rs.getInt("Count");
            }
        } catch (SQLException e) {
        }
        return a;
    }
}
