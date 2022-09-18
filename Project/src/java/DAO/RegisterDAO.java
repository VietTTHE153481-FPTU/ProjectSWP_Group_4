/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author trung
 */
public class RegisterDAO extends DBContext {

    public User checkAccountExist(String username) {
        String sql = "SELECT [username]\n"
                + "      ,[password]\n"
                + "      ,[fullname]\n"
                + "      ,[phone]\n"
                + "      ,[gender]\n"
                + "      ,[email]\n"
                + "      ,[roleId]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[User]\n"
                + "  WHERE [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
                return a;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void create(String username, String password, String fullname,
            String phone, String sex, String Email) {
        String sql = "insert into Users values(?, ?, ? ,? ,?, ?, 3, 1)";
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
}
