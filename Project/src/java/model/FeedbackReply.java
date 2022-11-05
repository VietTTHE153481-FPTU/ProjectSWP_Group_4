/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class FeedbackReply {
    int id, feedbackID, userID, productID;
    String repliesText;

    public FeedbackReply() {
    }
   
    public FeedbackReply(int id, int feedbackID, int userID, int productID, String repliesText) {
        this.id = id;
        this.feedbackID = feedbackID;
        this.userID = userID;
        this.productID = productID;
        this.repliesText = repliesText;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getRepliesText() {
        return repliesText;
    }

    public void setRepliesText(String repliesText) {
        this.repliesText = repliesText;
    }

    @Override
    public String toString() {
        return "Reply Feedback{" + "ID=" + id + ", FeedbackID=" + feedbackID +", UserID=" + userID + ", ProductID=" + productID + ", RepliesText=" + repliesText + '}';
    }
    
    
}
