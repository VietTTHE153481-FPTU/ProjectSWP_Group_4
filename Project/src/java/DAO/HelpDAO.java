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

    public List<HelpCenter> getHelpCenterBySearch(String key) {
        List<HelpCenter> list = new ArrayList<>();
        String sql = "select hc.* from HelpCategory hc where hc.CategoryName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HelpCenter hc = HelpCenter.builder().
                        CategoryID(rs.getInt(1)).
                        CategoryName(rs.getString(2)).
                        Image(rs.getString(3)).
                        build();
                list.add(hc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<HelpContent> getHelpContentBySearch(String key) {
        List<HelpContent> list = new ArrayList<>();
        String sql = "select h.* from HelpContent h where h.Content like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HelpContent hc = HelpContent.builder().
                        ContentID(rs.getInt(1)).
                        Content(rs.getString(2)).
                        TitlteID(rs.getInt(3)).
                        build();
                list.add(hc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<HelpContent> getAllHelpContent() {
        List<HelpContent> list = new ArrayList<>();
        String sql = "select h.* from HelpContent h";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HelpContent hc = HelpContent.builder().
                        ContentID(rs.getInt(1)).
                        Content(rs.getString(2)).
                        TitlteID(rs.getInt(3)).
                        build();
                list.add(hc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int countAllHelpContentBySearch(String key){
        int a = 0;
        String sql = "select count(h.ContentID) from HelpContent h where h.Content like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a = rs.getInt(1);
            }
            
        } catch (SQLException e) {
        }
        return a;
    }


    public static void main(String[] args) {
        HelpDAO hd = new HelpDAO();
        List<HelpContent> list = hd.getHelpContentBySearch("đăng");
        HelpTitle ht = hd.getHelpTitle(1);
//        System.out.println(ht);
        //List<HelpCenter> list = hd.getHelpCenterBySearch("thanh");
//        for (HelpContent hc : list) {
//            System.out.println(hc);
//        }
         int a = hd.countAllHelpContentBySearch("");
         System.out.println(a);
    }
}
