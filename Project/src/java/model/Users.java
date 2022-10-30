/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class Users {

    int userID;
    String username, password, fullname, phone;
    boolean gender;
    String email;
    int roleId;
    int shopId;
    int statusId;

    public Users() {
    }

    public Users(int userID, String username, String password, String fullname, String phone, boolean gender, String email, int roleId, int shopId, int statusId) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.gender = gender;
        this.email = email;
        this.roleId = roleId;
        this.shopId = shopId;
        this.statusId = statusId;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleId() {
        return roleId;
    }

    public String getRoleName() {
        switch (roleId) {
            case 1:
                return "Admin";
            case 2:
                return "Seller";
            case 3:
                return "Customer";
            default:
                return "Shipper";
        }
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getStatusID() {
        switch (statusId) {
            case 1:
                return "Active";
            case 2:
                return "Locked";
            case 3:
                return "Gmail Login";
            default:
                return "Unverified";
        }
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

}
