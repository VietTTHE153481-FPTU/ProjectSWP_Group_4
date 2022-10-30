/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.Shop;
import model.Users;

/**
 *
 * @author trung
 */
public class RegisterDAO extends DBContext {

    public Users checkAccountExist(String username) {
        String sql = "SELECT * FROM [dbo].[Users] WHERE [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users a = new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10));
                return a;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void create(String username, String password, String fullname,
            String phone, String sex, String Email) {
        String sql = "insert into Users values(?, ?, ? ,? ,?, ?, 3, NULL, 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, fullname);
            st.setString(4, phone);
            st.setString(5, sex);
            st.setString(6, Email);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateseller(int shopid,String username) {
        String sql = "UPDATE Users\n"
                + "SET RoleID = 2, ShopID = ?\n"
                + "WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, shopid);
            st.setString(2, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateShop(String shopname){
        String sql = "INSERT INTO Shop VALUES (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, shopname);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public Shop getShopBySellerId(int id) {
        String sql = "SELECT ID, ShopName FROM Shop WHERE ID = ?";
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
    
    public Shop getShopByShopname(String shopname){
        String sql = "SELECT ID, ShopName FROM Shop WHERE ShopName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, shopname);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop sh = new Shop();
                sh.setID(rs.getInt("ID"));
                sh.setShopName(rs.getString("ShopName"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<Shop> getShopsByShopname(String shopname) {
        List<Shop> list = new ArrayList<>();
        String sql = "SELECT ID, ShopName FROM Shop WHERE ShopName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, shopname);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Shop(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    
    public Users getAccByUsername(String user) {
        String sql = "select * from dbo.[Users] where Username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean getStringInput(String str, String regex) {
        if (str.trim().isEmpty() || !str.matches(regex)) {
            return false;
        } else {
            return true;
        }
    }

    public String bytesToHex(String password) {
        MessageDigest digest;
        byte[] hash = null;
        try {
            digest = MessageDigest.getInstance("SHA-256");
            hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    public static void main(String[] args) {
//        String password = "123";
//        RegisterDAO rd = new RegisterDAO();
//        System.out.println(rd.bytesToHex(password));
        RegisterDAO rd = new RegisterDAO();        
       
        List<Shop> shop = rd.getShopsByShopname("Best seller");
        
        for (Shop shop1 : shop) {
            System.out.println(shop1.getID());
        }
    }

}
