/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UserAddress;
import model.Users;

public class AccountDAO extends DBContext {

    public boolean isAccountValid(Users acc) {
        String sql = "  select * from Users where Username=? or Email=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, acc.getUsername());
            st.setString(2, acc.getEmail());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
        }
        return true;
    }

    public void addAccount(Users acc) {
        String sql = "insert into Users values(?, ?, ? ,? ,?, ?, 3, NULL, 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, acc.getUsername());
            st.setString(2, acc.getPassword());
            st.setString(3, acc.getFullname());
            st.setString(4, acc.getPhone());
            st.setBoolean(5, acc.isGender());
            st.setString(6, acc.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
        }
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

    public Users getAccByEmail(String email) {
        String sql = "select * from dbo.[Users] where Email=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean isAccountExist(String user, String pass) {
        String sql = "select * from Users where Username=? and Password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public void changePass(String username, String pass) {
        String sql = "  update Users\n"
                + "  set Password= ? \n"
                + "  where Username= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getNoAcc() {
        String sql = "SELECT COUNT(UserID) AS Count,RoleID FROM dbo.Users WHERE RoleID=3 GROUP BY RoleID ";
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

}
