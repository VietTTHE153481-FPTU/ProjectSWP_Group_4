/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.seller;

import DAO.AccountDAO;
import DAO.OrderDAO;
import DAO.notiDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.Users;
import model.noti;

/**
 *
 * @author Minhm
 */
@WebServlet(name = "ManageOrderServlet", urlPatterns = {"/ManageOrder"})
public class ManageOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageOrderServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        AccountDAO dao = new AccountDAO();
        OrderDAO or = new OrderDAO();
        Users hold = (Users) session.getAttribute("account");
        List<Order> a = or.getAllByShopID(hold.getShopId());
        for (Order end : a) {
            end.setUsername(dao.getUserByID(end.getUserId()));
        }
        request.setAttribute("data", a);
        request.getRequestDispatcher("SellerViewOrder.jsp").forward(request, response);
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
        OrderDAO dao = new OrderDAO();
        notiDAO dao2 = new notiDAO();
        int OID = Integer.parseInt(request.getParameter("orderID"));
        String status = (request.getParameter("status") == null) ? "" : request.getParameter("status");
        String note = (request.getParameter("note") == null) ? "" : request.getParameter("note");
        String type = request.getParameter("bu");
        List<String> lmao = new ArrayList<>();
        lmao.add("Waiting for Confirmation");
        lmao.add("Packaging");
        lmao.add("Delivering");
        lmao.add("Canceled");
        lmao.add("Completed");
        if (type.equals("Up")) {
            dao2.newNoti(new noti(1, dao.getUserByOrderID(OID), "The status of the rder with ID: " + OID + " had been changed to " + lmao.get(Integer.parseInt(status)), OID));
            dao.upDateOrderStatus(note, status, OID);
            response.sendRedirect("ManageOrder");
            return;
        } else {
            dao2.newNoti(new noti(1, dao.getUserByOrderID(OID), "The Order with ID: " + OID + " had been deleted to " + lmao.get(Integer.parseInt(status)), OID));
            dao.DelOrder(OID);
            response.sendRedirect("ManageOrder");
        }

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
