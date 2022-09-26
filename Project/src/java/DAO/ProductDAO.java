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
 * @author trung
 */
public class ProductDAO extends DBContext {

    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,\n"
                + "MIN(p.Description) AS Description, MIN(p.OriginalPrice) AS OriginalPrice,\n"
                + "MIN(p.SellPrice) AS SellPrice, MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.SellerID) AS SellerID,\n"
                + "MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID, MIN(p.BrandID) AS BrandID,\n"
                + "MIN(ProI.ProductImgURL) AS ProductImgURL, MIN(Sub.CategoryID) AS CategoryID\n"
                + "FROM dbo.Product p JOIN dbo.ProductImg ProI ON ProI.ProductID = p.ProductID\n"
                + "		      JOIN dbo.SubCategory Sub ON Sub.SubCategoryID = p.SubCategoryID\n"
                + "GROUP BY p.ProductID ) t";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
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
                p.setCategoryID(rs.getInt("CategoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Products> getNewProducts() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT TOP(15) * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,\n"
                + "MIN(p.Description) AS Description, MIN(p.OriginalPrice) AS OriginalPrice,\n"
                + "MIN(p.SellPrice) AS SellPrice, MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.SellerID) AS SellerID,\n"
                + "MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID, MIN(p.BrandID) AS BrandID,\n"
                + "MIN(ProI.ProductImgURL) AS ProductImgURL, MIN(Sub.CategoryID) AS CategoryID\n"
                + "FROM dbo.Product p JOIN dbo.ProductImg ProI ON ProI.ProductID = p.ProductID\n"
                + "		      JOIN dbo.SubCategory Sub ON Sub.SubCategoryID = p.SubCategoryID\n"
                + "GROUP BY p.ProductID ) t\n"
                + "ORDER BY t.ProductID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
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
                p.setCategoryID(rs.getInt("CategoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Products> getProductByCid(int cid, int sid, int sortType, int sortMode) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,\n"
                + "MIN(p.Description) AS Description, MIN(p.OriginalPrice) AS OriginalPrice,\n"
                + "MIN(p.SellPrice) AS SellPrice, MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.SellerID) AS SellerID,\n"
                + "MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID, MIN(p.BrandID) AS BrandID,\n"
                + "MIN(ProI.ProductImgURL) AS ProductImgURL, MIN(Sub.CategoryID) AS CategoryID\n"
                + "FROM dbo.Product p JOIN dbo.ProductImg ProI ON ProI.ProductID = p.ProductID\n"
                + "	              JOIN dbo.SubCategory Sub ON Sub.SubCategoryID = p.SubCategoryID\n"
                + "WHERE 1=1 AND p.StatusID!= 2 AND p.Amount>0 ";
        if (cid != 0) {
            sql += "AND Sub.CategoryID=" + cid;
        }
        if (sid != 0) {
            sql += "AND Sub.SubCategoryID=" + sid;
        }
        sql += "GROUP BY p.ProductID) t";
        switch (sortType) {
            case 0:
                break;
            case 1:
                sql += " ORDER BY t.SellPrice ";
                break;
            case 2:
                sql += " ORDER BY t.SalePercent ";
                break;
            case 3:
                sql += " ORDER BY t.ProductName ";
                break;
        }
        if (sortType != 0) {
            if (sortMode == 1) {
                sql += " ASC ";
            }
            if (sortMode == 2) {
                sql += " DESC ";
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
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
                p.setCategoryID(rs.getInt("CategoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
