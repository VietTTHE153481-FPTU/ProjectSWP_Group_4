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
import model.HelpContent;
import model.HelpTitle;

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
                        CategoryID(rs.getInt("CategoryID")).
                        CategoryName(rs.getString("CategoryName")).
                        Image(rs.getString("Image")).build();
                list.add(hc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<HelpTitle> getAllHelpTitle() {
        List<HelpTitle> listAll = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[HelpTitle]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                HelpTitle hc = HelpTitle.builder().
                        TitleID(rs.getInt("TitleID")).
                        Title(rs.getString("Title")).
                        UserID(rs.getInt("UserID")).
                        CategoryID(rs.getInt("CategoryID")).build();
                listAll.add(hc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAll;
    }
    
    public HelpTitle getHelpTitle(int stid) {
        String sql = "SELECT * FROM [HelpTitle] WHERE TitleID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new HelpTitle(rs.getInt("TitleID"),
                        rs.getString("Title"),
                        rs.getInt("UserID"),
                        rs.getInt("CategoryID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<HelpContent> getHelpContentByID(int seid, int stid) {
        List<HelpContent> list = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT co.ContentID, MIN(co.Content) AS Content,\n"
                + "MIN(co.TitleID) AS TitleID, MIN(ht.Title) AS Title, MIN(ht.CategoryID) AS CategoryID\n"
                + "FROM HelpContent co JOIN HelpTitle ht ON co.TitleID = ht.TitleID\n";
        if (seid != 0) {
            sql += " AND ht.CategoryID= " + seid;
        }
        if (stid != 0) {
            sql += " AND ht.TitleID= " + stid;
        }
        sql += " GROUP BY co.ContentID) t";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                HelpContent hc = HelpContent.builder().
                        ContentID(rs.getInt("ContentID")).
                        Content(rs.getString("Content")).
                        TitlteID(rs.getInt("TitleID")).build();
                list.add(hc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
