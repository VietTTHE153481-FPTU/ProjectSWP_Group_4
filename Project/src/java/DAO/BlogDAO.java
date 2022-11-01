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
import model.BlogDetail;

/**
 *
 * @author trung
 */
public class BlogDAO extends DBContext {

    public List<Blog> getHotBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP 3 bg.*, u.fullname FROM Blog bg JOIN Users u\n"
                + "ON bg.AuthorID = u.UserID\n"
                + "ORDER BY [Day] DESC, [Month] DESC, [Year] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog bg = new Blog();
                bg.setId(rs.getInt("ID"));
                bg.setDay(rs.getInt("Day"));
                bg.setMonth(rs.getString("Month"));
                bg.setYear(rs.getInt("Year"));
                bg.setTitle(rs.getString("BlogTitle"));
                bg.setContent(rs.getString("BlogContent"));
                bg.setImageLink(rs.getString("imageLink"));
                bg.setAuthorId(rs.getInt("AuthorID"));
                list.add(bg);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Blog]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog bg = new Blog();
                bg.setId(rs.getInt("ID"));
                bg.setDay(rs.getInt("Day"));
                bg.setMonth(rs.getString("Month"));
                bg.setYear(rs.getInt("Year"));
                bg.setTitle(rs.getString("BlogTitle"));
                bg.setContent(rs.getString("BlogContent"));
                bg.setImageLink(rs.getString("imageLink"));
                bg.setAuthorId(rs.getInt("AuthorID"));
                list.add(bg);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Blog getBlogs(int id) {
        String sql = "SELECT * FROM [dbo].[Blog] WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Blog(rs.getInt("ID"),
                        rs.getInt("Day"),
                        rs.getString("Month"),
                        rs.getInt("Year"),
                        rs.getString("BlogTitle"),
                        rs.getString("BlogContent"),
                        rs.getString("imageLink"),
                        rs.getInt("AuthorID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Blog getBlogByAuthor(int id) {
        String sql = "SELECT * FROM [dbo].[Blog] WHERE AuthorID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Blog(rs.getInt("ID"),
                        rs.getInt("Day"),
                        rs.getString("Month"),
                        rs.getInt("Year"),
                        rs.getString("BlogTitle"),
                        rs.getString("BlogContent"),
                        rs.getString("imageLink"),
                        rs.getInt("AuthorID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public BlogDetail getBlogDetail(int id) {
        String sql = "SELECT * FROM [dbo].[BlogDetail] WHERE BlogDetailID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new BlogDetail(rs.getInt("BlogDetailID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("imgBlogDetail"),
                        rs.getInt("BlogID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<BlogDetail> getBlogDetailById(int id) {
        List<BlogDetail> list = new ArrayList<>();
        String sql = "select * from BlogDetail, Blog where BlogDetail.BlogID = Blog.ID and Blog.ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BlogDetail bd = BlogDetail.builder()
                        .BlogDetailID(rs.getInt(1)).
                        Title(rs.getString(2)).
                        Content(rs.getString(3)).
                        imgBlogDetail(rs.getString(4)).
                        BlogID(rs.getInt(5))
                        .build();
                list.add(bd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<BlogDetail> getBlogDetailBySearch(String key, int bid) {
        List<BlogDetail> list = new ArrayList<>();
        String sql = "select * from BlogDetail bd where bd.BlogID = ? and (bd.Title like ? or bd.Content like ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setString(2, "%" + key + "%");
            ps.setString(3, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BlogDetail bd = BlogDetail.builder()
                        .BlogDetailID(rs.getInt(1)).
                        Title(rs.getString(2)).
                        Content(rs.getString(3)).
                        imgBlogDetail(rs.getString(4)).
                        BlogID(rs.getInt(5))
                        .build();
                list.add(bd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getBlogBySearch(String key) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog b JOIN Users u ON b.AuthorID = u.UserID where b.BlogTitle like ? or b.BlogContent like ? or u.fullname like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, "%" + key + "%");
            ps.setString(3, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog bd = Blog.builder()
                        .id(rs.getInt(1)).
                        day(rs.getInt(2)).
                        month(rs.getString(3)).
                        year(rs.getInt(4)).
                        title(rs.getString(5)).
                        content(rs.getString(6)).
                        imageLink(rs.getString(7)).
                        authorId(rs.getInt(8))
                        .build();
                list.add(bd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateBlog(int id, String title, String content, String imageLink) {
        String sql = "UPDATE [Blog] SET [BlogTitle] = ? ,[BlogContent] = ?, [imageLink] = ? WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setString(3, imageLink);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }
    
    public void updateBlogdetail(int id, String title, String content, String imgBlogDetail) {
        String sql = "UPDATE [BlogDetail] SET [Title] = ? ,[Content] = ? ,[imgBlogDetail] = ? WHERE BlogDetailID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setString(3, imgBlogDetail);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }
    
    public void addBlog(String content, String title,String image,int id){
        String sql = "INSERT INTO dbo.Blog([Day], [Month], [Year], BlogTitle, BlogContent, imageLink, AuthorID)VALUES(1, 'November', 2022, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setString(3, image);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }
    
    public void addBlogDetail(String content, String title, String imgBlogDetail, int id){
        String sql = "INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setString(3, imgBlogDetail);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }
    
    public void addBlog1(String content, String title, String imageLink, int id){
        String sql = "INSERT INTO dbo.Blog([Day], [Month], [Year], BlogTitle, BlogContent, imageLink, AuthorID) VALUES(1, 'November', 2022, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setString(3, imageLink);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }
    
    public void delete(int id) {
        String sql = "DELETE FROM [Blog] WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteDetail(int id) {
        String sql = "DELETE FROM [BlogDetail] WHERE BlogDetailID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    
    public int getAccountBlog(int id) {
        int a = 0;
        String sql = "SELECT count(Blog.ID) FROM [dbo].[Blog] WHERE AuthorID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return a;
    }
    
    public int totalBlogDetail(int id) {
        int a = 0;
        String sql = "SELECT count(BlogDetailID) FROM [dbo].[BlogDetail] WHERE BlogID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return a;
    }
    
    public static void main(String[] args) {
        BlogDAO bd = new BlogDAO();
       // Blogdetail blogs = bd.getBlogs(id);
         BlogDetail bld = bd.getBlogDetail(13);
         
        System.out.println(bld);
    }
}
