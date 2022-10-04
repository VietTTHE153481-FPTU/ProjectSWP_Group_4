/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class BlogDetail {
    int BlogDetailID;
    String Title;
    String Content;
    String imgBlogDetail;
    int BlogID;
    

    public BlogDetail() {
    }

    public BlogDetail(int BlogDetailID, String Title, String Content, String imgBlogDetail, int BlogID) {
        this.BlogDetailID = BlogDetailID;
        this.Title = Title;
        this.Content = Content;
        this.imgBlogDetail = imgBlogDetail;
        this.BlogID = BlogID;
    }

    public int getBlogDetailID() {
        return BlogDetailID;
    }

    public void setBlogDetailID(int BlogDetailID) {
        this.BlogDetailID = BlogDetailID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getImgBlogDetail() {
        return imgBlogDetail;
    }

    public void setImgBlogDetail(String imgBlogDetail) {
        this.imgBlogDetail = imgBlogDetail;
    }

    public int getBlogID() {
        return BlogID;
    }

    public void setBlogID(int BlogID) {
        this.BlogID = BlogID;
    }
    
}
