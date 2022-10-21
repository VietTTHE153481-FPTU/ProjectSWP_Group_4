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
import model.Role;

/**
 *
 * @author trung
 */
public class AdminDAO extends DBContext {

    public Users check(String username, String password) {
        String sql = "SELECT * FROM [dbo].[Users] WHERE [username] = ? and [password] = ?";
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
        }
        return null;
    }

    public List<Role> getRole() {
        List<Role> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Role]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role p = new Role();
                p.setID(rs.getInt("ID"));
                p.setRoleName(rs.getString("RoleName"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
