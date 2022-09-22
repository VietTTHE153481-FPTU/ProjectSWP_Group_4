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
import model.Product;

/**
 *
 * @author trung
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT  * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,MIN(p.Description) AS Description,\n"
                + "MIN(p.OriginalPrice) AS OriginalPrice,MIN(p.SellPrice) AS SellPrice,MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID,MIN(p.SellerID) AS SellerID,MIN(p.Amount) AS Amount,\n"
                + "MIN(p.StatusID) AS StatusID,MIN(p.BrandID) AS BrandID,MIN(ProI.ProductImgURL) AS ProductImgURL FROM \n"
                + "dbo.Product p\n"
                + "JOIN  dbo.ProductImg ProI\n"
                + "ON ProI.ProductID = p.ProductID\n"
                + "GROUP BY p.ProductID ) t";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setOriginalPrice(rs.getDouble("OriginalPrice"));
                p.setSellPrice(rs.getDouble("SellPrice"));
                p.setSalePercent(rs.getDouble("SalePercent"));
                p.setSubCategoryID(rs.getInt("SubCategoryID"));
                p.setSellerID(rs.getInt("SellerID"));
                p.setAmount(rs.getInt("Amount"));
                p.setStatusID(rs.getInt("StatusID"));
                p.setBrandID(rs.getInt("BrandID"));
                p.setUrl(rs.getString("ProductImgURL"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getNewProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT top(10) * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,MIN(p.Description) AS Description,\n"
                + "MIN(p.OriginalPrice) AS OriginalPrice,MIN(p.SellPrice) AS SellPrice,MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID,MIN(p.SellerID) AS SellerID,MIN(p.Amount) AS Amount,\n"
                + "MIN(p.StatusID) AS StatusID,MIN(p.BrandID) AS BrandID,\n"
                + "MIN(ProI.ProductImgURL) AS ProductImgURL FROM \n"
                + "dbo.Product p \n"
                + "JOIN  dbo.ProductImg ProI \n"
                + "ON ProI.ProductID = p.ProductID \n"
                + "GROUP BY p.ProductID ) t";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setOriginalPrice(rs.getDouble("OriginalPrice"));
                p.setSellPrice(rs.getDouble("SellPrice"));
                p.setSalePercent(rs.getDouble("SalePercent"));
                p.setSubCategoryID(rs.getInt("SubCategoryID"));
                p.setSellerID(rs.getInt("SellerID"));
                p.setAmount(rs.getInt("Amount"));
                p.setStatusID(rs.getInt("StatusID"));
                p.setBrandID(rs.getInt("BrandID"));
                p.setUrl(rs.getString("ProductImgURL"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
