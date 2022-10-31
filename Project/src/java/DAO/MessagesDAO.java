/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    public int CheckForExistingInbox(int UserID1,int UserID2){
        String sql="select  c.room_id, c.is_Private,c.name,d.member_id,d.UserID from (select a.room_id, a.is_Private,a.name,b.member_id,b.UserID from chat_room as a, member as b\n" +
                    "where	a.room_id = b.room_id and a.is_Private = 1 and b.member_id = ?) as c, member as d\n" +
                    "where d.room_id = c.room_id and d.member_id != c.member_id";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserID1);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                if(rs.getInt("member_id")==UserID2)return rs.getInt("room_id");
            }
        } catch (Exception e) {
        }
        return -1;
    }
//    public Messages_group getAllByGroupID(int id) {
//        return null;
//    }
    //select * from member where UserID = 4
    public List<Messages_group> GetAllGroupListOfUsers(int uID){
        String sql="select * from member where UserID = ?";
        List<Messages_group> list = new ArrayList<>();
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(getMessageByGroupID(rs.getInt("room_id")));
            }
        }catch(Exception ex){
            
        }     
        return list;
    }
    public Messages_group getMessageByGroupID(int groupID) {
        String sql="Select * from messsages where room_id = ?";
        List<Messages> list = new ArrayList<>();
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, groupID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Messages(rs.getInt("message_id"), rs.getInt("UserID"), rs.getString("Message"), rs.getString("Date")));
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage()+ex.getLocalizedMessage());
        }
        String sql2= "Select * from chat_room where room_id = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql2);
            ps.setInt(1, groupID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Messages_group(list, groupID, rs.getBoolean("is_Private"), rs.getString("name"));
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static void main(String[] args) {
//        MessagesDAO test = new MessagesDAO();
//        List<Messages_group> a = test.GetAllGroupListOfUsers(4);
//        System.out.println(a.get(0).getMessagesInGroup().get(0).getMessage());
    }
}
