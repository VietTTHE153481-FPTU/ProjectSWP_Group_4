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
import model.Shop;
import model.Users;

/**
 *
 * @author trung
 */
public class ShopDAO extends DBContext {

    public List<Shop> getAllShop() {
        List<Shop> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Shop]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop sh = new Shop();
                sh.setID(rs.getInt("ID"));
                sh.setShopName(rs.getString("ShopName"));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Shop getShopBySellerId(int id) {
        String sql = "SELECT * FROM Shop WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop sh = new Shop();
                sh.setID(rs.getInt("ID"));
                sh.setShopName(rs.getString("ShopName"));
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
