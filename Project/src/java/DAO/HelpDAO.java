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
import model.HelpCenter;

/**
 *
 * @author trung
 */
public class HelpDAO extends DBContext {

    public List<HelpCenter> getAllHelpCenter() {
        List<HelpCenter> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[HelpCategory]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                HelpCenter hc = HelpCenter.builder().
                ID(rs.getInt("ID")).
                CategoryName(rs.getString("CategoryName")).
                Image(rs.getString("Image")).build();
                list.add(hc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
