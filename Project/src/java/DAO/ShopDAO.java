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

/**
 *
 * @author trung
 */
public class ShopDAO extends DBContext {

    public List<Shop> getAllShop() {
        List<Shop> list = new ArrayList<>();
        String sql = "SELECT * FROM [Shop]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop sh = new Shop();
                sh.setID(rs.getInt("ID"));
                sh.setShopName(rs.getString("ShopName"));
                list.add(sh);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Shop getShopById(int id) {
        String sql = "SELECT * FROM Shop WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Shop(rs.getInt("ID"),
                        rs.getString("ShopName")
                );
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Shop> getUserBySearch(String key) {
        List<Shop> list = new ArrayList<>();
        String sql = "select * from Shop s JOIN Users u ON s.ID = u.ShopID where s.ShopName like ? or u.fullname like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Shop sh = new Shop();
                sh.setID(rs.getInt("ID"));
                sh.setShopName(rs.getString("ShopName"));
                list.add(sh);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalShop(String key) {
        int a = 0;
        String sql = "select count(s.ID) from Shop s JOIN Users u ON s.ID = u.ShopID where s.ShopName like ? or u.fullname like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return a;
    }
    
    public int getTotalProduct(int id) {
        int a = 0;
        String sql = "SELECT count(ProductID) FROM [Product] WHERE ShopID = ?";
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
        ShopDAO sd = new ShopDAO();
        Shop shop = sd.getShopById(4);
        System.out.println(shop);
    }
}
