/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//import javax.scene.input.KeyCode;

/**
 *
 * @author trung
 */
public class AdminDAO extends DBContext {

    public Users check(String username, String password) {
        String sql = "SELECT [UserID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[fullname]\n"
                + "      ,[phone]\n"
                + "      ,[gender]\n"
                + "      ,[email]\n"
                + "      ,[RoleID]\n"
                + "      ,[ShopID]\n"
                + "      ,[StatusID]\n"
                + "  FROM [dbo].[Users]\n"
                + "  WHERE [username] = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
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

    public List<Users> getAllAccount() {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Users]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users p = new Users();
                p.setUserID(rs.getInt("userID"));
                p.setUsername(rs.getString("username"));
                p.setPassword(rs.getString("password"));
                p.setFullname(rs.getString("fullname"));
                p.setPhone(rs.getString("phone"));
                p.setGender(rs.getBoolean("gender"));
                p.setEmail(rs.getString("email"));
                p.setRoleId(rs.getInt("roleId"));
                p.setShopId(rs.getInt("shopId"));
                p.setStatusId(rs.getInt("statusId"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Users getAccount(String username) {
        String sql = "select * from Users where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users p = new Users();
                p.setUserID(rs.getInt("userID"));
                p.setUsername(rs.getString("username"));
                p.setPassword(rs.getString("password"));
                p.setFullname(rs.getString("fullname"));
                p.setPhone(rs.getString("phone"));
                p.setGender(rs.getBoolean("gender"));
                p.setEmail(rs.getString("email"));
                p.setRoleId(rs.getInt("roleId"));
                p.setShopId(rs.getInt("shopId"));
                p.setStatusId(rs.getInt("statusId"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Users getUserByID(int id) {
        String sql = "SELECT * FROM [Users] WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users p = new Users();
                p.setUserID(rs.getInt("userID"));
                p.setUsername(rs.getString("username"));
                p.setPassword(rs.getString("password"));
                p.setFullname(rs.getString("fullname"));
                p.setPhone(rs.getString("phone"));
                p.setGender(rs.getBoolean("gender"));
                p.setEmail(rs.getString("email"));
                p.setRoleId(rs.getInt("roleId"));
                p.setShopId(rs.getInt("shopId"));
                p.setStatusId(rs.getInt("statusId"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updateUserProfile(int id, String fullname, String phone, String email, int gender) {
        String sql = "update Users set fullname = ?, phone = ?, email = ?, gender = ? where UserID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setInt(4, gender);
            ps.setInt(5, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Users> getUserBySearch(String key) {
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users u JOIN Role r ON u.RoleID = r.ID where u.username like ? or u.fullname like ? or r.RoleName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, "%" + key + "%");
            ps.setString(3, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Users p = new Users();
                p.setUserID(rs.getInt("userID"));
                p.setUsername(rs.getString("username"));
                p.setPassword(rs.getString("password"));
                p.setFullname(rs.getString("fullname"));
                p.setPhone(rs.getString("phone"));
                p.setGender(rs.getBoolean("gender"));
                p.setEmail(rs.getString("email"));
                p.setRoleId(rs.getInt("roleId"));
                p.setShopId(rs.getInt("shopId"));
                p.setStatusId(rs.getInt("statusId"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countAllUserBySearch(String key) {
        int a = 0;
        String sql = "select count(u.UserID) from Users u JOIN Role r ON u.RoleID = r.ID where u.username like ? or u.fullname like ? or r.RoleName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, "%" + key + "%");
            ps.setString(3, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return a;
    }

    public static void main(String[] args) {
        AdminDAO ad = new AdminDAO();
        Users ul = ad.getUserByID(6);
        List<Users> us = ad.getUserBySearch("anh");
        System.out.println(ul);

    }
}
