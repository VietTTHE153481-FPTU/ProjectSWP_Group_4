/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Messages;
import model.Messages_group;
import model.Users;

/**
 *
 * @author Minhm
 */
public class MessagesDAO extends DBContext {

    AccountDAO dao = new AccountDAO();

    public int CheckForExistingInbox(int UserID1, int UserID2) {
        String sql = "select c.room_id from\n"
                + "(select  b.room_id, b.is_Private,b.name\n"
                + "from member as a,chat_room as b \n"
                + "where a.UserID = ? and a.room_id = b.room_id and b.is_Private = 1) as c,\n"
                + "member as d\n"
                + "where c.room_id = d.room_id and d.UserID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserID1);
            ps.setInt(2, UserID2);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("room_id");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }
//    public Messages_group getAllByGroupID(int id) {
//        return null;
//    }
    //select * from member where UserID = 4

    public List<Messages_group> GetAllGroupListOfUsers(int uID) {
        String sql = "select * from member where UserID = ?";
        List<Messages_group> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getMessageByGroupID(rs.getInt("room_id"), dao.getUserByID(getOp(rs.getInt("room_id"), uID))));
            }
        } catch (Exception ex) {

        }
        return list;
    }

    public int getOp(int room, int Uid1) {
        String sql = "select * from member where room_id = ? and UserID != ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, room);
            ps.setInt(2, Uid1);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("UserID");
            }
        } catch (Exception ex) {

        }
        return -1;
    }

    public Messages_group getMessageByGroupID(int groupID, String toUser) {
        String sql = "Select * from messsages where room_id = ?";
        List<Messages> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, groupID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Messages(rs.getInt("message_id"), rs.getInt("UserID"), rs.getString("Message"), rs.getString("Date"), dao.getUserByID(rs.getInt("UserID"))));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage() + ex.getLocalizedMessage());
        }
        String sql2 = "Select * from chat_room where room_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql2);
            ps.setInt(1, groupID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getBoolean("is_Private")) {
                    return new Messages_group(list, groupID, toUser);
                } else {
                    return new Messages_group(list, groupID, rs.getBoolean("is_Private"), rs.getString("name"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public void newRoom(int[] memberID, String name) {
        boolean is_private = memberID.length == 2 ? true : false;
        int num_O_user = memberID.length;

        String getRoom = "select top(1)* from chat_room order by room_id desc";
        String sql = "INSERT INTO [dbo].[chat_room]\n"
                + "           ([is_Private]\n"
                + "           ,[name])\n"
                + "     VALUES\n"
                + "           (?,?)";
        String sql2 = "INSERT INTO [dbo].[member]\n"
                + "           ([room_id]\n"
                + "           ,[UserID])\n"
                + "     VALUES\n"
                + "           (?,?)";
        String sql3 = sql2;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, is_private);
            ps.setString(2, name);
            ps.execute();
            PreparedStatement ps2 = connection.prepareStatement(getRoom);
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("room_id");

                PreparedStatement ps3 = connection.prepareStatement(sql2);
                ps3.setInt(1, id);
                ps3.setInt(2, memberID[0]);
                ps3.execute();
                PreparedStatement ps4 = connection.prepareStatement(sql3);
                ps4.setInt(1, id);
                ps4.setInt(2, memberID[1]);
                ps4.execute();

            }
        } catch (Exception ex) {
            System.out.println(ex.getLocalizedMessage());
        }
    }

    public void SaveNewMessage(int room, String message, int Uid) {
        String sql = "INSERT INTO [dbo].[messsages]\n"
                + "           ([room_id]\n"
                + "           ,[UserID]\n"
                + "           ,[Message]\n"
                + "           ,[Date])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String date = dtf.format(now);
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, room);
            ps.setInt(2, Uid);
            ps.setString(3, message);
            ps.setString(4, date);
            ps.execute();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static void main(String[] args) {
        MessagesDAO test = new MessagesDAO();
//        test.newRoom(new int[]{1, 4}, null);
        List<Messages_group> a = test.GetAllGroupListOfUsers(4);
        System.out.println(a.get(0).getToUser());
    }
}
