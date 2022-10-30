/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class UserAddress {

    private int ID;
    private int UserID;
    private String ShipName;
    private String PhoneNum;
    private int ShipCityID;
    private String NoteDetail;

    public UserAddress() {
    }

    public UserAddress(int ID, int UserID, String ShipName, String PhoneNum, int ShipCityID, String NoteDetail) {
        this.ID = ID;
        this.UserID = UserID;
        this.ShipName = ShipName;
        this.PhoneNum = PhoneNum;
        this.ShipCityID = ShipCityID;
        this.NoteDetail = NoteDetail;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getShipName() {
        return ShipName;
    }

    public void setShipName(String ShipName) {
        this.ShipName = ShipName;
    }

    public String getPhoneNum() {
        return PhoneNum;
    }

    public void setPhoneNum(String PhoneNum) {
        this.PhoneNum = PhoneNum;
    }

    public int getShipCityID() {
        return ShipCityID;
    }

    public void setShipCityID(int ShipCityID) {
        this.ShipCityID = ShipCityID;
    }

    public String getNoteDetail() {
        return NoteDetail;
    }

    public void setNoteDetail(String NoteDetail) {
        this.NoteDetail = NoteDetail;
    }
}
