/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Users;


public class AccountDAO extends DBContext {

    public boolean isAccountValid(Users acc) {
        String sql = "  select * from Accounts where Username=? or Email=? ";
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
        String sql = "insert into Users values(?, ?, ? ,? ,?, ?, 3, 1)";
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
                return new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
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

    public void changePass(Users acc, String pass) {
        String sql = "  update Users\n"
                + "  set Password= ? \n"
                + "  where Username= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, acc.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getNoAcc() {
        String sql = "select count(*) from Users";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    


}