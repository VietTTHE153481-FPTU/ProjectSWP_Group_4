/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class SubCategory {

    int subCateID;
    int cateID;
    String subCateName;

    public SubCategory() {
    }

    public SubCategory(int subCateID, int cateID, String subCateName) {
        this.subCateID = subCateID;
        this.cateID = cateID;
        this.subCateName = subCateName;
    }

    public int getSubCateID() {
        return subCateID;
    }

    public void setSubCateID(int subCateID) {
        this.subCateID = subCateID;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getSubCateName() {
        return subCateName;
    }

    public void setSubCateName(String subCateName) {
        this.subCateName = subCateName;
    }
}
