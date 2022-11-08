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
import model.Comment;

/**
 *
 * @author trung
 */
public class CommentDAO extends DBContext {

    public List<Comment> getCommentByBlogID(int id) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT * FROM [CommentBlogs] WHERE BlogID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment cm = new Comment();
                cm.setID(rs.getInt("ID"));
                cm.setBlogID(rs.getInt("BlogID"));
                cm.setUserID(rs.getInt("UserID"));
                cm.setComment(rs.getString("Comment"));
                list.add(cm);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Comment getCommentByID(int id) {
        String sql = "SELECT * FROM [CommentBlogs] WHERE ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Comment(rs.getInt("ID"),
                        rs.getInt("BlogID"),
                        rs.getInt("UserID"),
                        rs.getString("Comment"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addComment(int BlogID, int UserID, String Comment) {
        String sql = "INSERT INTO [dbo].[CommentBlogs] ([BlogID], [UserID], [Comment]) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, BlogID);
            st.setInt(2, UserID);
            st.setString(3, Comment);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }

    public void deleteComment(int id) {
        String sql = "DELETE FROM CommentBlogs WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public static void main(String[] args) {
        CommentDAO cd = new CommentDAO();
        Comment c = cd.getCommentByID(13);
        int commentid = c.getID();
        System.out.println(commentid);
    }
}
