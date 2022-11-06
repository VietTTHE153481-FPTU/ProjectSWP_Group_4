/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import static java.sql.JDBCType.NULL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.noti;

/**
 *
 * @author Minhm
 */
public class notiDAO extends DBContext {

    private DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    private LocalDateTime now = LocalDateTime.now();

    public List<noti> getALLByUid(int Uid) {
        String sql = "select * from Notifications\n"
                + "where UserID = ? order by time desc";
        List<noti> hold = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hold.add(new noti(rs.getInt("ID"), rs.getInt("UserID"), rs.getString("Content"),rs.getInt("OrderID")));
            }
        } catch (Exception e) {
        }
        return hold;
    }

    public void newNoti(noti a) {
        String sql = "INSERT INTO [dbo].[Notifications]\n"
                + "           ([UserID]\n"
                + "           ,[OrderID]\n"
                + "           ,[Content]\n"
                + "           ,[time])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, a.getUid());
            ps.setInt(2, a.getOid());
            ps.setString(3, a.getContent());
            ps.setString(4, now.format(dtf));
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
    }
    public static void main(String[] args) {
        notiDAO dao = new notiDAO();
        dao.newNoti(new noti(1,1,"lmao thu xem",13));
    }
}
