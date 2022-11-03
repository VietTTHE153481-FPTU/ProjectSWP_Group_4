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
import model.Users;

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

    public String getAddressByUser(Users u) {
        String sql = "SELECT TOP(1) *\n"
                + "FROM            Ship INNER JOIN\n"
                + "                         UserAddress ON Ship.id = UserAddress.ShipCityID INNER JOIN\n"
                + "                         Users ON UserAddress.UserID = Users.UserID\n"
                + "Where Users.UserID= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getUserID());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("ShipName") + " " + rs.getString("PhoneNum") + " " + rs.getString("NoteDetail") + " " + rs.getString("CityName");
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getShippingFee(Users u) {
        String sql = "SELECT       Ship.ShipPrice, UserAddress.ShipName, Ship.CityName\n"
                + "FROM            Ship INNER JOIN\n"
                + "                         UserAddress ON Ship.id = UserAddress.ShipCityID AND UserAddress.UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getUserID());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("ShipPrice");
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
        UserAddressDAO uad = new UserAddressDAO();
        AccountDAO ad = new AccountDAO();
        Users u = ad.getAccById(5);
        String address = uad.getAddressByUser(u);
        System.out.println(address);
    }

}
