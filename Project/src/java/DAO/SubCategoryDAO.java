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
import model.SubCategory;

/**
 *
 * @author trung
 */
public class SubCategoryDAO extends DBContext {

    public List<SubCategory> getAllSubCategory() {
        List<SubCategory> list = new ArrayList<>();
        String sql = "SELECT [SubCategoryID]\n"
                + "      ,[SubCategoryName]\n"
                + "      ,[CategoryID]\n"
                + "  FROM [dbo].[SubCategory]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SubCategory sc = new SubCategory();
                sc.setSubCateID(rs.getInt("SubCategoryID"));
                sc.setCateID(rs.getInt("CategoryID"));
                sc.setSubCateName(rs.getString("SubCategoryName"));
                list.add(sc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
