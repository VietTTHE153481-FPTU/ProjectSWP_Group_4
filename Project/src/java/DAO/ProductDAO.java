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

    public void insert(String productName, String Description, double OriginalPrice, double SellPrice, double SalePercent,
            int SubCategoryID, int ShopID, int Amount) {
        String sql = "INSERT INTO [dbo].[Product]([ProductName], [Description], [OriginalPrice],\n"
                + "[SellPrice], [SalePercent],[SubCategoryID], [ShopID], [Amount], [StatusID])\n"
                + "VALUES (?,?,?,?,?,?,?,?,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productName);
            st.setString(2, Description);
            st.setDouble(3, OriginalPrice);
            st.setDouble(4, SellPrice);
            st.setDouble(5, SalePercent);
            st.setInt(6, SubCategoryID);
            st.setInt(7, ShopID);
            st.setInt(8, Amount);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertProductImg(int id, String image) {
        try {
            String sql1 = "INSERT INTO [dbo].[ProductImg]\n"
                    + "           ([ProductID]\n"
                    + "           ,[ProductImgURL])\n"
                    + "     VALUES\n"
                    + "           (?,?)";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, id);
            st1.setString(2, image);
            st1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Products getInsertProduct(int id) {
        String sql = "SELECT  TOP(1)  Product.ProductID, Product.ProductName, Product.Description, Product.OriginalPrice, Product.SellPrice, Product.SalePercent, Product.SubCategoryID, Product.ShopID, Shop.ShopName, Product.Amount, Product.StatusID, \n"
                + "                         SubCategory.CategoryID\n"
                + "FROM            Product INNER JOIN\n"
                + "                         SubCategory ON Product.SubCategoryID = SubCategory.SubCategoryID CROSS JOIN\n"
                + "                         Shop\n"
                + "WHERE Product.ShopID = ? order by Product.ProductID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        null,
                        rs.getInt(12)
                );
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void update(int productID, String productName, String Description, double OriginalPrice, double SellPrice, double SalePercent,
            int SubCategoryID, int Amount) {
        String sql = "UPDATE [dbo].[Product] SET [ProductName] = ?, [Description] = ?, [OriginalPrice] = ?,\n"
                + "[SellPrice] = ?, [SalePercent] = ?, [SubCategoryID] = ?, [Amount] = ?, [StatusID] = 1\n"
                + " WHERE [ProductID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productName);
            st.setString(2, Description);
            st.setDouble(3, OriginalPrice);
            st.setDouble(4, SellPrice);
            st.setDouble(5, SalePercent);
            st.setInt(6, SubCategoryID);
            st.setInt(7, Amount);
            st.setInt(8, productID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateImg(int productID, String productImgURL) {
        String sql1 = "UPDATE [dbo].[ProductImg]\n"
                + "   SET \n"
                + "      [ProductImgURL] = ?\n"
                + " WHERE [ProductID] = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, productImgURL);
            st1.setInt(2, productID);
            st1.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int id) {
        String sql1 = "DELETE FROM Order_Detail\n"
                + "      WHERE ProductID = ?";
        String sql2 = "DELETE FROM Cart\n"
                + "      WHERE ProductID = ?";
        String sql3 = "DELETE FROM Feedback\n"
                + "      WHERE ProductID = ?";
        String sql4 = "DELETE FROM Feedback_Replies\n"
                + "      WHERE ProductID = ?";
        String sql5 = "DELETE FROM ProductImg\n"
                + "      WHERE ProductID = ?";
        String sql6 = "DELETE FROM Favorite_Product\n"
                + "      WHERE ProductID = ?";
        String sql7 = "DELETE FROM Recent_Product\n"
                + "      WHERE ProductID = ?";
        String sql = "DELETE FROM Product\n"
                + "      WHERE ProductID = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, id);
            st1.executeUpdate();
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setInt(1, id);
            st3.executeUpdate();
            PreparedStatement st4 = connection.prepareStatement(sql4);
            st4.setInt(1, id);
            st4.executeUpdate();
            PreparedStatement st5 = connection.prepareStatement(sql5);
            st5.setInt(1, id);
            st5.executeUpdate();
            PreparedStatement st6 = connection.prepareStatement(sql6);
            st6.setInt(1, id);
            st6.executeUpdate();
            PreparedStatement st7 = connection.prepareStatement(sql7);
            st7.setInt(1, id);
            st7.executeUpdate();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void recentproduct(int userid, int productid, String date) {
        String sql = "INSERT INTO [dbo].[Recent_Product]\n"
                + "           ([UserID]\n"
                + "           ,[ProductID]\n"
                + "           ,[Date])\n"
                + "     VALUES\n"
                + "           (?,?,'?')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userid);
            st.setInt(2, productid);
            st.setString(3, date);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteRecentProduct(int userid, int productid) {
        String sql = "DELETE FROM [dbo].[Recent_Product]\n"
                + "      WHERE ProductID= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userid);
            st.setInt(2, productid);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public Products getRecentProduct(int userid, int productid) {
        String sql = "select * from Recent_Product where UserID= ? and ProductID= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userid);
            st.setInt(2, productid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Products p = new Products();
                p.setProductID(2);
                return p;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Products> getAllRecentProduct(int userid) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT       Product.*\n"
                + "FROM            Product INNER JOIN\n"
                + "                         Recent_Product ON Product.ProductID = Recent_Product.ProductID"
                + "where Recent_Product.UserID= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setOriginalPrice(rs.getDouble(4));
                p.setSellPrice(rs.getDouble(5));
                p.setSalePercent(rs.getDouble(6));
                p.setSubCategoryID(rs.getInt(7));
                p.setShopID(rs.getInt(8));
                p.setAmount(rs.getInt(9));
                p.setStatusID(rs.getInt(10));
                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Products getProductByFeedbackID(int id) {
        String sql = "SELECT       Product.ProductID, Product.ProductName, Product.Description\n"
                + "FROM            Feedback INNER JOIN\n"
                + "                         Product ON Feedback.ProductID = Product.ProductID\n"
                + "WHERE        Feedback.ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Products p = new Products();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(1));
                p.setDescription(rs.getString(2));
                return p;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public static void main(String[] args) {

    }
}
