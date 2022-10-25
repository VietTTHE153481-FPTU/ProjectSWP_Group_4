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
    private String ShipName;
    private String NoteDetail;
    private int ShipCityID;
    private String PhoneNume;

    public UserAddress() {
    }

    public UserAddress(int ID, String ShipName, String NoteDetail, int ShipCityID, String PhoneNume) {
        this.ID = ID;
        this.ShipName = ShipName;
        this.NoteDetail = NoteDetail;
        this.ShipCityID = ShipCityID;
        this.PhoneNume = PhoneNume;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getShipName() {
        return ShipName;
    }

    public void setShipName(String ShipName) {
        this.ShipName = ShipName;
    }

    public String getNoteDetail() {
        return NoteDetail;
    }

    public void setNoteDetail(String NoteDetail) {
        this.NoteDetail = NoteDetail;
    }

    public int getShipCityID() {
        return ShipCityID;
    }

    public void setShipCityID(int ShipCityID) {
        this.ShipCityID = ShipCityID;
    }

    public String getPhoneNume() {
        return PhoneNume;
    }

    public void setPhoneNume(String PhoneNume) {
        this.PhoneNume = PhoneNume;
    }
}
