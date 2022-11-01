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
import model.UserAddress;

/**
 *
 * @author trung
 */
public class UserAddressDAO extends DBContext {

    public List<UserAddress> getUserAddress(int id) {
        List<UserAddress> list = new ArrayList<>();
        String sql = "SELECT * FROM UserAddress WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserAddress ua = new UserAddress();
                ua.setID(rs.getInt("ID"));
                ua.setUserID(rs.getInt("UserID"));
                ua.setShipName(rs.getString("ShipName"));
                ua.setNoteDetail(rs.getString("NoteDetail"));
                ua.setShipCityID(rs.getInt("ShipCityID"));
                ua.setPhoneNum(rs.getString("PhoneNum"));
                list.add(ua);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateAddress(int id, String fullname, String phone, int inputCity, String note) {
        String sql = "UPDATE [dbo].[UserAddress]\n"
                + "   SET [UserID] = ?\n"
                + "      ,[ShipName] = ?\n"
                + "      ,[PhoneNum] = ?\n"
                + "      ,[ShipCityID] = ?\n"
                + "      ,[NoteDetail] = ?\n"
                + " WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, fullname);
            st.setString(3, phone);
            st.setInt(4, inputCity);
            st.setString(5, note);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addAddress(int id, String fullname, String phone, int inputCity,
            String note) {
        String sql = "INSERT INTO [UserAddress] VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, fullname);
            st.setString(3, phone);
            st.setInt(4, inputCity);
            st.setString(5, note);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [UserAddress] WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        UserAddressDAO ad = new UserAddressDAO();
        ad.addAddress(6, "Trung Việt", "0369147268", 52, "Sơn La");

        System.out.println(ad);
    }

}
