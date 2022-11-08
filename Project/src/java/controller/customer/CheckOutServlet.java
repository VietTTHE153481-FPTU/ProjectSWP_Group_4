/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import DAO.CartDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DAO.ShipDAO;
import DAO.UserAddressDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.text.DecimalFormat;
import model.Cart;
import model.Order;
import model.UserAddress;
import model.Users;

/**
 *
 * @author Minhm
 */
@WebServlet(name = "checkout", urlPatterns = {"/CheckOut"})
public class CheckOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PlaceOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlaceOrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pd = new ProductDAO();
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("account");
        UserAddressDAO uad = new UserAddressDAO();
        String address = uad.getAddressByUser(u);
        double shippingfee = uad.getShippingFee(u);
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String format = formatter.format(shippingfee).toString();
        Cart c = (Cart) session.getAttribute("cart");

        request.setAttribute("money", shippingfee);
        request.setAttribute("shippingfee", format);
        request.setAttribute("address", address);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        Users u = (Users) session.getAttribute("account");
        OrderDAO od = new OrderDAO();
        OrderDetailDAO odd = new OrderDetailDAO();
        UserAddressDAO uad = new UserAddressDAO();
        ShipDAO sd = new ShipDAO();
        Order o = new Order();
        Date d = new Date();
        CartDAO cd= new CartDAO();
        double shippingfee = uad.getShippingFee(u);
        
        String noti = request.getParameter("notice");
        o.setUserId(u.getUserID());
        o.setTotalPrice(c.totalmoney()+shippingfee);
        o.setNote(noti);
        o.setDate(d);
        od.createOrder(o);
        Order co = od.getCheckOutOrder(u.getUserID());
        odd.insertOrderDetail(c, co.getId());
        UserAddress ud = uad.getDefaultAddress(u.getUserID());
        sd.insertShipInfo(co.getId(), noti, ud);
        cd.removeCart(u.getUserID());      
        session.removeAttribute("cart");
        request.setAttribute("mess", "Order Successfully");
//        request.getRequestDispatcher("feedback.jsp").forward(request, response);
        response.sendRedirect("Done");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
