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
import model.Category;
import model.Products;

/**
 *
 * @author trung
 */
public class CategoryDAO extends DBContext {

    //Lấy toàn bộ từ bàng Category
    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("CategoryID"));
                c.setCategoryName(rs.getString("CategoryName"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Lấy toàn bộ từ bàng Products
    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[describe]\n"
                + "      ,[materials]\n"
                + "      ,[releaseDate]\n"
                + "      ,[image]\n"
                + "      ,[cid]\n"
                + "  FROM [dbo].[Products_HE163615]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setMaterials(rs.getString("materials"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //Lấy ra danh mục sản phẩm theo ID
    public Category getCategoryById(String id) {
        String sql = "select * from Category_HE163615 where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getByte("CategoryID"));
                c.setCategoryName(rs.getNString("CategoryName"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //lấy ra sản phâm theo id
    public Products getProductsById(int id) {
        String sql = "select * from Products_HE163615 where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setMaterials(rs.getString("materials"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setImage(rs.getString("image"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public Products getProducts(String txt) {
        String sql = "select * from Products_HE163615 where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setMaterials(rs.getString("materials"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setImage(rs.getString("image"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public List<Products> getNewProduct() {
        List<Products> list = new ArrayList<>();
        String sql = "select top 10 * from Products_HE163615\n"
                + "order by releaseDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setMaterials(rs.getString("materials"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //Lấy sản phẩm ra từ bảng Products theo cid
    public List<Products> getProductByCid(int cid) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[describe]\n"
                + "      ,[materials]\n"
                + "      ,[releaseDate]\n"
                + "      ,[image]\n"
                + "      ,[cid]\n"
                + "  FROM [dbo].[Products_HE163615]\n"
                + "  where 1=1 ";
        if (cid != 0) {
            sql += " and cid=" + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setDescribe(rs.getString("materials"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //tìm kiếm sản phẩm
    public List<Products> search(String txt, int index) throws SQLException {
        List<Products> list = new ArrayList<>();
        String sql = "select * from\n"
                + "(select ROW_NUMBER () over (order by id asc) as r, * \n"
                + "from Products_HE163615 where [name] like ?) as x\n"
                + "where r between ? * 8 - 7 and ? * 8";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            st.setInt(2, index);
            st.setInt(3, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescribe(rs.getString("describe"));
                p.setDescribe(rs.getString("materials"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //đếm tổng số sản phẩm được tìm thấy theo tên
    public int count(String txt) throws SQLException {
        try {
            String sql = "select count (*) from Products_HE163615 where [name] like ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    //Đếm tổng số sản phẩm trong bảng Products
    public int getTotalProduct() {
        String sql = "Select count (*) from Products_HE163615";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    //Phân chia số sản phẩm trên 1 trang
    public List<Products> pagingProduct(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products_HE163615\n"
                + "ORDER BY ID\n"
                + "OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(index, (index - 1) * 8);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new Products(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getDouble(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //insert thêm sản phẩm vào bảng Products
    public void insert(Products p, String category) {
        String sql = "INSERT INTO [dbo].[Products_HE163615]\n"
                + "           ([ID]"
                + "           ,[name]\n"
                + "           ,[price]\n"
                + "           ,[describe]\n"
                + "           ,[materials]\n"
                + "           ,[releaseDate]\n"
                + "           ,[image]\n"
                + "           ,[cid])\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getId());
            st.setString(2, p.getName());
            st.setDouble(3, p.getPrice());
            st.setString(4, p.getDescribe());
            st.setString(5, p.getMaterials());
            st.setString(6, p.getReleaseDate());
            st.setString(7, p.getImage());
            st.setString(8, category);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Chỉnh sửa thông tin của sản phẩm
    public void update(Products p) {
        String sql = "UPDATE [dbo].[Products_HE163615]\n"
                + "   SET [name] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[materials] = ?\n"
                + "      ,[releaseDate] = ?\n"
                + "      ,[image] = ?\n"
                + " WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setDouble(2, p.getPrice());
            st.setString(3, p.getDescribe());
            st.setString(4, p.getMaterials());
            st.setString(5, p.getReleaseDate());
            st.setString(6, p.getImage());
            st.setInt(7, p.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Xóa 1 sản phẩm trong bảng Products theo Id
    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Products_HE163615]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
