/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Cart;
import model.item;
import model.Products;
import DAO.ProductDAO;

/**
 *
 * @author Minhm
 */
public class CartDAO extends DBContext {

    ProductDAO midman = new ProductDAO();

    public Cart getAll(int userID, Cart lmao) {
        String sql = "select * from cart where UserID = ?";
        Cart end = new Cart();
        if (lmao != null) {
            for (item a : lmao.getListItem()) {
                end.addItem(a);
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                end.addItem(new item(midman.getProductById(rs.getInt("ProductID")), rs.getInt("Amount")));
            }
        } catch (Exception ex) {
            return null;
        }
        return end;
    }

    public void makeEdit(int pid, int uid, int ammount) {
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET [Amount] = ?\n"
                + " WHERE UserID = ? and ProductID = ?";
        if(ammount==0)delAnItem(pid, uid);
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ammount);
            ps.setInt(2, uid);
            ps.setInt(3, pid);
            ps.executeUpdate();
        } catch (Exception ex) {
            
        }
    }
    public void delAnItem(int iid,int uid){
        String sql = "DELETE FROM [dbo].[Cart]\n"
                + "      WHERE UserID = ? and ProductID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, iid);
            ps.executeUpdate();
        }catch(Exception ex){
            
        }
    }
    public void removeCart(int uid) { //xoa tk thi dung ham nay xoa cart truoc thay proc
        String sql = "DELETE FROM [dbo].[Cart]\n"
                + "      WHERE UserID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.executeUpdate();
        }catch(Exception ex){
            
        }
    }

    public void SaveAllItem(Cart a, int uid) {
        removeCart(uid);
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([UserID]\n"
                + "           ,[ProductID]\n"
                + "           ,[Amount])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            for (item t : a.getListItem()) {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, uid);
                ps.setInt(2, t.getItem_product().getProductID());
                ps.setInt(3, t.getNumO());
                ps.executeUpdate();
            }

        } catch (Exception ex) {

        }
    }
    public static void main(String[] args) {
        CartDAO test = new CartDAO();
        test.makeEdit(2, 5, 10);
    }

}
