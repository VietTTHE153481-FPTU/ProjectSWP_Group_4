/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import DAO.AccountDAO;
import DAO.FavoriteProductDAO;
import DAO.FeedbackDAO;
import DAO.ProductDAO;
import DAO.ShopDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Feedback;
import model.FeedbackReply;
import model.Products;
import model.Shop;
import model.Users;

/**
 *
 * @author trung
 */
@WebServlet(name = "DetailServlet", urlPatterns = {"/detail"})
public class DetailServlet extends HttpServlet {

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
            out.println("<title>Servlet DetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailServlet at " + request.getContextPath() + "</h1>");
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
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Date d = new Date();
            SimpleDateFormat dt1 = new SimpleDateFormat("yyyyy-MM-dd");
            AccountDAO ad = new AccountDAO();
            ProductDAO pd = new ProductDAO();
            FeedbackDAO fd = new FeedbackDAO();
            FavoriteProductDAO fpd = new FavoriteProductDAO();
            Products p = pd.getProductById(id);
            HttpSession session = request.getSession();
            Users u = (Users) session.getAttribute("account");
            int num = fpd.countFavoriteProduct(id);
            List<Feedback> feedback = fd.getFeedbackbyProductID(id);
            List<FeedbackReply> reply = fd.getAllFeedbackReply();
            List<Users> user = ad.getAllAccount();
            if (u != null) {
                String id_raw = request.getParameter("id");
                String list = "";
                Cookie[] hold = request.getCookies();
                for (Cookie item : hold) {
                    if (item.getName().equalsIgnoreCase("list")) {
                        list = item.getValue() + "!" + id_raw;
                    }
                }
                Cookie end = new Cookie("list", list);
                end.setMaxAge(3600*24*30);
                response.addCookie(end);
            }

            request.setAttribute("reply", reply);
            request.setAttribute("user", user);
            request.setAttribute("feedback", feedback);
            request.setAttribute("detail", p);
            request.setAttribute("num", num);
            request.getRequestDispatcher("detail.jsp").forward(request, response);
        } catch (NumberFormatException ex) {
            System.out.println(ex);
        }
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
        processRequest(request, response);
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
