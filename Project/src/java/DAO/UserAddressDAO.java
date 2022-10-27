/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.UserAddress;

/**
 *
 * @author trung
 */
public class UserAddressDAO extends DBContext {
    
    public UserAddress getUserAddress(int id) {
        String sql = "SELECT * FROM (SELECT ua.ID, MIN(ua.ShipName) AS ShipName, MIN(ua.NoteDetail) AS NoteDetail,\n"
                + "MIN(ua.ShipCityID) AS CityID, MIN(ua.PhoneNum) AS Phone, MIN(u.UserID) AS UserID\n"
                + "FROM UserAddress ua JOIN Users u ON ua.PhoneNum = u.phone\n"
                + "WHERE u.UserID = ?\n"
                + "GROUP BY ua.ID) t";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new UserAddress(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
}
