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
import model.Favorite_Products;
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
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.ShopID) AS ShopID,\n"
                + "MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID,\n"
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
                p.setShopID(rs.getInt("ShopID"));
                p.setAmount(rs.getInt("Amount"));
                p.setStatusID(rs.getInt("StatusID"));
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
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.ShopID) AS ShopID,\n"
                + "MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID,\n"
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
                p.setShopID(rs.getInt("ShopID"));
                p.setAmount(rs.getInt("Amount"));
                p.setStatusID(rs.getInt("StatusID"));
                p.setUrl(rs.getString("ProductImgURL"));
                p.setCategoryID(rs.getInt("CategoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Products> getProductByCid(String key, int cid, int sid, int sortType, int sortMode) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,\n"
                + "MIN(p.Description) AS Description, MIN(p.OriginalPrice) AS OriginalPrice,\n"
                + "MIN(p.SellPrice) AS SellPrice, MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.ShopID) AS ShopID,\n"
                + "MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID,\n"
                + "MIN(ProI.ProductImgURL) AS ProductImgURL, MIN(Sub.CategoryID) AS CategoryID\n"
                + "FROM dbo.Product p JOIN dbo.ProductImg ProI ON ProI.ProductID = p.ProductID\n"
                + "	              JOIN dbo.SubCategory Sub ON Sub.SubCategoryID = p.SubCategoryID\n"
                + "WHERE p.ProductName LIKE ? AND p.StatusID!= 2 AND p.Amount>0 ";
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
            st.setString(1, "%" + key + "%");
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
                p.setShopID(rs.getInt("ShopID"));
                p.setAmount(rs.getInt("Amount"));
                p.setStatusID(rs.getInt("StatusID"));
                p.setUrl(rs.getString("ProductImgURL"));
                p.setCategoryID(rs.getInt("CategoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Products getProductById(int id) {
        String sql = "SELECT * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,\n"
                + "MIN(p.Description) AS Description, MIN(p.OriginalPrice) AS OriginalPrice,\n"
                + "MIN(p.SellPrice) AS SellPrice, MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.ShopID) AS ShopID,\n"
                + "MIN(s.ShopName) as ShopName, MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID,\n"
                + "MIN(ProI.ProductImgURL) AS ProductImgURL, MIN(Sub.CategoryID) AS CategoryID\n"
                + "FROM dbo.Product p JOIN dbo.ProductImg ProI ON ProI.ProductID = p.ProductID\n"
                + "		      JOIN dbo.SubCategory Sub ON Sub.SubCategoryID = p.SubCategoryID\n"
                + "			  JOIN dbo.Shop s ON s.ID = p.ShopID\n"
                + "GROUP BY p.ProductID ) t where t.ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Products(rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("OriginalPrice"),
                        rs.getDouble("SellPrice"),
                        rs.getDouble("SalePercent"),
                        rs.getInt("SubCategoryID"),
                        rs.getInt("ShopID"),
                        rs.getString("ShopName"),
                        rs.getInt("Amount"),
                        rs.getInt("StatusID"),
                        rs.getString("ProductImgURL"),
                        rs.getInt("CategoryID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Products getProductByShopId(int id) {
        String sql = "SELECT * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,\n"
                + "MIN(p.Description) AS Description, MIN(p.OriginalPrice) AS OriginalPrice,\n"
                + "MIN(p.SellPrice) AS SellPrice, MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.ShopID) AS ShopID,\n"
                + "MIN(s.ShopName) as ShopName, MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID,\n"
                + "MIN(ProI.ProductImgURL) AS ProductImgURL, MIN(Sub.CategoryID) AS CategoryID\n"
                + "FROM dbo.Product p JOIN dbo.ProductImg ProI ON ProI.ProductID = p.ProductID\n"
                + "		      JOIN dbo.SubCategory Sub ON Sub.SubCategoryID = p.SubCategoryID\n"
                + "			  JOIN dbo.Shop s ON s.ID = p.ShopID\n"
                + "GROUP BY p.ProductID ) t where t.shopId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Products(rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("OriginalPrice"),
                        rs.getDouble("SellPrice"),
                        rs.getDouble("SalePercent"),
                        rs.getInt("SubCategoryID"),
                        rs.getInt("ShopID"),
                        rs.getString("ShopName"),
                        rs.getInt("Amount"),
                        rs.getInt("StatusID"),
                        rs.getString("ProductImgURL"),
                        rs.getInt("CategoryID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Products> getProductsbyShopid(int id, String key, int cid, int sortType, int sortMode) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,\n"
                + "MIN(p.Description) AS Description, MIN(p.OriginalPrice) AS OriginalPrice,\n"
                + "MIN(p.SellPrice) AS SellPrice, MIN(p.SalePercent) AS SalePercent,\n"
                + "MIN(p.SubCategoryID) AS SubCategoryID, MIN(p.ShopID) AS ShopID,\n"
                + "MIN(p.Amount) AS Amount, MIN(p.StatusID) AS StatusID,\n"
                + "MIN(ProI.ProductImgURL) AS ProductImgURL, MIN(Sub.CategoryID) AS CategoryID\n"
                + "FROM dbo.Product p JOIN dbo.ProductImg ProI ON ProI.ProductID = p.ProductID\n"
                + "	              JOIN dbo.SubCategory Sub ON Sub.SubCategoryID = p.SubCategoryID\n"
                + "WHERE p.ShopID = ? AND p.ProductName LIKE ? AND p.StatusID!= 2 AND p.Amount>0 ";
        if (cid != 0) {
            sql += "AND Sub.CategoryID=" + cid;
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
            st.setInt(1, id);
            st.setString(2, "%" + key + "%");
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
                p.setShopID(rs.getInt("ShopID"));
                p.setAmount(rs.getInt("Amount"));
                p.setStatusID(rs.getInt("StatusID"));
                p.setUrl(rs.getString("ProductImgURL"));
                p.setCategoryID(rs.getInt("CategoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Favorite_Products> getMyWishlist(int id) {
        List<Favorite_Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Favorite_Product WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Favorite_Products fp = new Favorite_Products();
                fp.setUserID(rs.getInt("UserID"));
                fp.setProductID(rs.getInt("ProductID"));
                list.add(fp);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public int totalProductInWishlish(int id) {
        int a = 0;
        String sql = "SELECT COUNT(ProductID) AS Count FROM Favorite_Product WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return a = rs.getInt("Count");
            }
        } catch (SQLException e) {
        }
        return a;
    }

    public int getNumProductByShopId(int id) {
        int a = 0;
        String sql = "SELECT COUNT(ProductID) AS Count FROM Product WHERE ShopID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return a = rs.getInt("Count");
            }
        } catch (SQLException e) {
        }
        return a;
    }

    public int countProducts() {
        String sql = "SELECT COUNT(ProductID) AS Count FROM dbo.Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("Count");
            }
        } catch (SQLException e) {
        }
        return 0;
    }
    
    public void deleteFromWishlist(int id) {
        String sql = "DELETE FROM [Favorite_Product] WHERE ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insert(Products p) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([ProductName]\n"
                    + "           ,[Description]\n"
                    + "           ,[OriginalPrice]\n"
                    + "           ,[SellPrice]\n"
                    + "           ,[SalePercent]\n"
                    + "           ,[SubCategoryID]\n"
                    + "           ,[ShopID]\n"
                    + "           ,[Amount]\n"
                    + "           ,[StatusID])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,1)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProductName());
            st.setString(2, p.getDescription());
            st.setDouble(3, p.getOriginalPrice());
            st.setDouble(4, p.getSellPrice());
            st.setDouble(5, p.getSalePercent());
            st.setInt(6, p.getSubCategoryID());
            st.setInt(7, p.getShopID());
            st.setInt(8, p.getAmount());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Products p) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [ProductName] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[OriginalPrice] = ?\n"
                + "      ,[SellPrice] = ?\n"
                + "      ,[SalePercent] = ?\n"
                + "      ,[SubCategoryID] = ?\n"
                + "      ,[ShopID] = ?\n"
                + "      ,[Amount] = ?\n"
                + "      ,[StatusID] = 1\n"
                + " WHERE ProductID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProductName());
            st.setString(2, p.getDescription());
            st.setDouble(3, p.getOriginalPrice());
            st.setDouble(4, p.getSellPrice());
            st.setDouble(5, p.getSalePercent());
            st.setInt(6, p.getSubCategoryID());
            st.setInt(7, p.getShopID());
            st.setInt(8, p.getAmount());
            st.setInt(9, p.getProductID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM ProductImg\n"
                + "      WHERE ProductID = ?";
        String sql1= "DELETE FROM Product\n"
                + "      WHERE ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {

        ProductDAO pd = new ProductDAO();        
        List<Products> products = pd.getProductsbyShopid(2, "", 0, 0, 0);
        for (Products product : products) {
            System.out.println(product.getProductName());
        }
        int num = pd.getNumProductByShopId(4);
        System.out.println(num);
//        for (Products product : products) {
//            System.out.println(product);
//        }
    }
}
