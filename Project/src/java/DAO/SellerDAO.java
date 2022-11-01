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
import model.Products;

/**
 *
 * @author Admin
 */
public class SellerDAO extends DBContext {

    public int countTotalProductBySeller(int id) {
        try {
            String sql = "select sum(p.Amount) from Product p where p.ShopID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int countTotalCustomerBySeller(int id) {
        try {
            String sql = "select count(distinct o.UserID) from Orders o ,  Order_Detail od, Product p where o.ID = od.Order_ID and p.ProductID=od.ProductID and p.ShopID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int countTotalOrderBySeller(int id) {
        try {
            String sql = "select count(distinct od.Order_ID) from Order_Detail od, Product p where od.ProductID = p.ProductID and p.ShopID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public List<Products> getProductBySeller(int id) {
        List<Products> list = new ArrayList<>();
        String sql = "select p.* from Product p , ProductStatus ps where ps.StatusID = p.StatusID and p.ShopID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 Products p = new Products();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setOriginalPrice(rs.getDouble("OriginalPrice"));
                p.setSellPrice(rs.getDouble("SellPrice"));
                p.setSalePercent(rs.getDouble("SalePercent"));
                p.setSubCategoryID(rs.getInt("SubCategoryID"));
                p.setShopID(rs.getInt("ShopID"));
                p.setAmount(rs.getInt("Amount"));
                p.setStatusID(rs.getInt("StatusID"));
                p.setUrl(rs.getString("ProductImgURL"));
                p.setCategoryID(rs.getInt("CategoryID"));
                list.add(p);
              }
          } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        SellerDAO sd = new SellerDAO();
//        System.out.println(sd.countTotalProductBySeller(1));
        List<Products> list = sd.getProductBySeller(1);
        for (Products products : list) {
            System.out.println(products);
        }
    }
}
