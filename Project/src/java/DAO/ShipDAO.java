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
import model.Ship;
import model.UserAddress;

/**
 *
 * @author trung
 */
public class ShipDAO extends DBContext {

    public List<Ship> getShip() {
        List<Ship> list = new ArrayList<>();
        String sql = "SELECT * FROM [Ship]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Ship sh = new Ship();
                sh.setId(rs.getInt("id"));
                sh.setCityName(rs.getString("cityName"));
                sh.setShipPrice(rs.getInt("shipPrice"));
                list.add(sh);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Ship getAddressByID(int id) {
        String sql = "SELECT * FROM [Ship] WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Ship sh = new Ship();
                sh.setId(rs.getInt("id"));
                sh.setCityName(rs.getString("cityName"));
                sh.setShipPrice(rs.getInt("shipPrice"));
                return sh;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertShipInfo(int id, String note ,UserAddress ud) {
        String sql = "INSERT INTO [dbo].[ShipInfo]\n"
                + "           ([Order_ID]\n"
                + "           ,[CustomerName]\n"
                + "           ,[ShippingAddress]\n"
                + "           ,[ShipCityID]\n"
                + "           ,[PhoneNum]\n"
                + "           ,[Note])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, ud.getShipName());
            st.setString(3, ud.getNoteDetail());
            st.setInt(4, ud.getShipCityID());
            st.setString(5, ud.getPhoneNum());
            st.setString(6, note);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    public static void main(String[] args) {
        UserAddressDAO uad= new UserAddressDAO();
        UserAddress ua= uad.getDefaultAddress(5);
        ShipDAO sd= new ShipDAO();
        sd.insertShipInfo(1, "Uwu", ua);
    }
}
