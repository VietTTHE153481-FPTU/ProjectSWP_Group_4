/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author trung
 */
public class Report {
    int reportId;
    int UserId;
    String ReportTitle;
    int ShopId;
    String ReportContent;
    Date Date;

    public Report() {
    }

    public Report(int reportId, int UserId, String ReportTitle, int ShopId, String ReportContent, Date Date) {
        this.reportId = reportId;
        this.UserId = UserId;
        this.ReportTitle = ReportTitle;
        this.ShopId = ShopId;
        this.ReportContent = ReportContent;
        this.Date = Date;
    }

    public int getReportId() {
        return reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public String getReportTitle() {
        return ReportTitle;
    }

    public void setReportTitle(String ReportTitle) {
        this.ReportTitle = ReportTitle;
    }

    public int getShopId() {
        return ShopId;
    }

    public void setShopId(int ShopId) {
        this.ShopId = ShopId;
    }

    public String getReportContent() {
        return ReportContent;
    }

    public void setReportContent(String ReportContent) {
        this.ReportContent = ReportContent;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
    }
    
    
}
