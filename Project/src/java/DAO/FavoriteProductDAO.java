/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author trung
 */
public class FavoriteProductDAO extends DBContext {

    public void addProductToWishlish(int uid, int pid) {
        String sql = "INSERT INTO [dbo].[Favorite_Product] ([UserID], [ProductID]) VALUES(?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.setInt(2, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error" + e);
        }
    }
    
    public int countFavoriteProduct(int id) {
        int a = 0;
        String sql = "SELECT COUNT(ProductID) AS Count FROM dbo.Favorite_Product WHERE ProductID = ?";
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
    
    public static void main(String[] args) {

        FavoriteProductDAO pd = new FavoriteProductDAO();
        int num = pd.countFavoriteProduct(2);
        System.out.println(num);
    }
}
