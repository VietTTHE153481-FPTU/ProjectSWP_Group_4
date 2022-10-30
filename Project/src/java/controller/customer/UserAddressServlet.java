/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customer;

import DAO.AdminDAO;
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
import java.util.List;
import model.Ship;
import model.UserAddress;
import model.Users;

/**
 *
 * @author trung
 */
@WebServlet(name="UserAddressServlet", urlPatterns={"/address"})
public class UserAddressServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserAddressServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserAddressServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserAddressDAO uad = new UserAddressDAO();
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("account");
        
        ShipDAO sd = new ShipDAO();
        List<Ship> ship = sd.getShip();
        List<UserAddress> list = uad.getUserAddress(u.getUserID());
        
        request.setAttribute("city", ship);
        request.setAttribute("address", list);
        request.getRequestDispatcher("address.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        int inputCity = Integer.parseInt(request.getParameter("inputCity"));
        String note = request.getParameter("note");
        
        UserAddressDAO uad = new UserAddressDAO();
        AdminDAO ad = new AdminDAO();
        Users u = ad.getUserByID(id);
        uad.addAddress(u.getUserID(), fullname, phone, inputCity, note);
        List<UserAddress> list = uad.getUserAddress(u.getUserID());
        request.setAttribute("address", list);
        response.sendRedirect("address");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
