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
import model.BlogDetail;

/**
 *
 * @author trung
 */
public class BlogDetailDAO extends DBContext {

    public List<BlogDetail> getBlogByID(int id) {
        List<BlogDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT MIN(bd.BlogDetailID) AS BlogDetailID, MIN(b.Title) AS BlogTitle, \n"
                + "MIN(b.Content) AS BlogContent, MIN(bd.Title) AS Title, MIN(bd.Content) AS Content,\n"
                + "MIN(bd.imgBlogDetail) AS imgBlogDetail, MIN(b.Author) AS Author,\n"
                + "MIN(b.[Day]) AS [Day], MIN(B.[Month]) AS [Month], MIN(B.[Year]) AS [Year]\n"
                + "FROM BlogDetail bd JOIN Blog b ON b.ID = bd.BlogID\n"
                + "WHERE b.ID = ?\n"
                + "GROUP BY bd.BlogDetailID) t";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BlogDetail bd = new BlogDetail();
                bd.setBlogDetailID(rs.getInt("BlogDetailID"));
                bd.setTitle(rs.getString("Title"));
                bd.setContent(rs.getString("Content"));
                bd.setImgBlogDetail(rs.getString("imgBlogDetail"));
                bd.setBlogID(rs.getInt("BlogID"));
                list.add(bd);
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
