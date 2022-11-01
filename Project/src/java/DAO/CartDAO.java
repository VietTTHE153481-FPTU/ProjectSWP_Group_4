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
            for (item a : lmao.getListItem()) 
            {
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

    public void SaveAllItem(Cart a) {
        
    }
}
