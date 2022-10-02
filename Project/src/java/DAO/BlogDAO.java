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
import model.Blog;

/**
 *
 * @author trung
 */
public class BlogDAO extends DBContext {

    public List<Blog> getHotBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP 3 * FROM [dbo].[Blog] \n"
                + "ORDER BY [Day] DESC, [Month] DESC, [Year] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog bg = new Blog();
                bg.setId(rs.getInt("ID"));
                bg.setAuthor(rs.getString("Author"));
                bg.setDay(rs.getInt("Day"));
                bg.setMonth(rs.getString("Month"));
                bg.setYear(rs.getInt("Year"));
                bg.setTitle(rs.getString("Title"));
                bg.setContent(rs.getString("Content"));
                bg.setImageLink(rs.getString("imageLink"));
                list.add(bg);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT [ID]\n"
                + "      ,[Author]\n"
                + "      ,[Day]\n"
                + "      ,[Month]\n"
                + "      ,[Year]\n"
                + "      ,[Title]\n"
                + "      ,[Content]\n"
                + "      ,[imageLink]\n"
                + "  FROM [dbo].[Blog]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog bg = new Blog();
                bg.setId(rs.getInt("ID"));
                bg.setAuthor(rs.getString("Author"));
                bg.setDay(rs.getInt("Day"));
                bg.setMonth(rs.getString("Month"));
                bg.setYear(rs.getInt("Year"));
                bg.setTitle(rs.getString("Title"));
                bg.setContent(rs.getString("Content"));
                bg.setImageLink(rs.getString("imageLink"));
                list.add(bg);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
