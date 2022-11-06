/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Minhm
 */
public class noti {
    int Id;
    int Uid;
    String content;
    String date;
    int Oid;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getUid() {
        return Uid;
    }

    public void setUid(int Uid) {
        this.Uid = Uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public noti() {
    }
    public int getOid(){
        return this.Oid;
    }
    public void setOid(int Oid){
        this.Oid = Oid;
    }
    public noti(int Id, int Uid, String content,int Oid) {
        this.Id = Id;
        this.Uid = Uid;
        this.content = content;
        this.Oid = Oid;
    }
    
}
