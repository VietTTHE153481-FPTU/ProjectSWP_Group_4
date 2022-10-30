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
}
