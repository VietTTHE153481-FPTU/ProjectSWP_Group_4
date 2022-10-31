/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Minhm
 */
public class Messages_group {

//    List<Users> UserInGroup;
    List<Messages> MessagesInGroup;
    int Group_ID;
    int[] userIDs;
    String toUser;
    boolean isPrivated;
    String name;

    public void setStatus(boolean a, String b) {
        this.isPrivated = a;
        this.name = b;
    }

//    public List<Users> getUserInGroup() {
//        return UserInGroup;
//    }
//
//    public void setUserInGroup(List<Users> UserInGroup) {
//        this.UserInGroup = UserInGroup;
//    }

    public List<Messages> getMessagesInGroup() {
        return MessagesInGroup;
    }

    public void setMessagesInGroup(List<Messages> MessagesInGroup) {
        this.MessagesInGroup = MessagesInGroup;
    }

    public int getGroup_ID() {
        return Group_ID;
    }

    public void setGroup_ID(int Group_ID) {
        this.Group_ID = Group_ID;
    }

    public Messages_group( List<Messages> MessagesInGroup, int Group_ID,String toUser) {
//        this.UserInGroup = UserInGroup; List<Users> UserInGroup,
        this.MessagesInGroup = MessagesInGroup;
        this.Group_ID = Group_ID;
        this.toUser = toUser;
        this.isPrivated = false;
        this.name = null;
    }

    public int[] getUserIDs() {
        return userIDs;
    }

    public void setUserIDs(int[] userIDs) {
        this.userIDs = userIDs;
    }

    public String getToUser() {
        return toUser;
    }

    public void setToUser(String toUser) {
        this.toUser = toUser;
    }

    public boolean isIsPrivated() {
        return isPrivated;
    }

    public void setIsPrivated(boolean isPrivated) {
        this.isPrivated = isPrivated;
    }
    public void setUsers(int[] userIDs){
        this.userIDs = userIDs;
    }

    public Messages_group(List<Messages> MessagesInGroup, int Group_ID, boolean isPrivated, String name) {
        this.MessagesInGroup = MessagesInGroup;
        this.Group_ID = Group_ID;
        this.isPrivated = isPrivated;
        this.name = name;
    }
    public String getName(){
        return this.name;
    }
    public Messages_group() {
    }
    @Override
    public String toString(){
        return this.Group_ID+"";
    }

}
