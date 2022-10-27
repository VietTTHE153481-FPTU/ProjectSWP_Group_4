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
import java.util.logging.Level;
import java.util.logging.Logger;
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

    public void updateseller(String username, String shopname) {
        String sql = "UPDATE Users\n"
                + "SET RoleID = 2\n"
                + "WHERE username = ?"
                + "AND shopname = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, shopname);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
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
        String password = "123";
        RegisterDAO rd = new RegisterDAO();
        System.out.println(rd.bytesToHex(password));
    }

}
