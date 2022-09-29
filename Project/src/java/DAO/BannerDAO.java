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
import model.Banner;

/**
 *
 * @author trung
 */
public class BannerDAO extends DBContext {

    public List<Banner> getAllBrand() {
        List<Banner> listBanner = new ArrayList<>();
        String sql = "SELECT [ID]\n"
                + "      ,[Img]\n"
                + "      ,[Title]\n"
                + "      ,[desc]\n"
                + "  FROM [dbo].[CBanner]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Banner bn = new Banner();
                bn.setId(rs.getInt("ID"));
                bn.setImg(rs.getString("Img"));
                bn.setTitle(rs.getString("Title"));
                bn.setDesc(rs.getString("desc"));
                listBanner.add(bn);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listBanner;
    }
}
