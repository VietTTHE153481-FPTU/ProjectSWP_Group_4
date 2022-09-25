/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.RegisterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Scanner;
import model.Users;

/**
 *
 * @author trung
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     public static boolean getStringInput(String str, String regex) {
        if (str.trim().isEmpty() || !str.matches(regex)) {
            return false;
        } else {
            return true;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String cfpassword = request.getParameter("cfpass");
        String fullname = request.getParameter("fname");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        String email = request.getParameter("mail");
        RegisterDAO rd = new RegisterDAO();
        HttpSession session = request.getSession();
        
          if (getStringInput(username, "^[a-zA-Z0-9]+$") == false) {
            request.setAttribute("mess", "Please input corrrect information that match username");
            response.sendRedirect("register");
        } else if (getStringInput(password, "  ^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{9,}$") == false) {
            request.setAttribute("mess", "Please input corrrect information that match password");
            response.sendRedirect("register");
        } else if (getStringInput(fullname, "^[a-zA-Z ]+$") == false) {
            request.setAttribute("mess", "Please input corrrect information that match fullname");
            response.sendRedirect("register");
        } else if (getStringInput(phone, "^(84|0[3|5|7|8|9])+([0-9]{8})$") == false) {
            request.setAttribute("mess", "Please input corrrect information that match phone number");
            response.sendRedirect("register");
        } else if (getStringInput(sex, "^(?i)(m|f|male|female)$") == false) {
            request.setAttribute("mess", "Please input corrrect information that match sex");
            response.sendRedirect("register");
        } else if (getStringInput(email, "^[a-zA-Z][a-zA-Z0-9\\-_]+@[a-zA-Z]+(\\.[a-zA-Z]+){1,3}$") == false) {
            request.setAttribute("mess", "Please input corrrect information that match email");
            response.sendRedirect("register");
        } else if (!password.equals(cfpassword)) {
            session.setAttribute("mess", "The entered Password must be the same!");
            response.sendRedirect("register");
        } else {
            Users a = rd.checkAccountExist(username);
            if (a == null) {
                //tiếp tục cho register
                rd.create(username, password, fullname, phone, sex, email);
                response.sendRedirect("login");
            } else {
                //đẩy về trang register
                session.setAttribute("mess", "The Username already exist!!");
                response.sendRedirect("register");
            }
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
