/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import DAO.AccountDAO;
import DAO.BlogDAO;
import DAO.CommentDAO;
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
import model.Blog;
import model.BlogDetail;
import model.Comment;
import model.Users;

/**
 *
 * @author Minhm
 */
@WebServlet(name = "BlogDetailServlet", urlPatterns = {"/blogdetail"})
public class BlogDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet BlogDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogDetailServlet at " + request.getContextPath() + "</h1>");
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
        BlogDAO b = new BlogDAO();
        CommentDAO cd = new CommentDAO();
        AccountDAO ad = new AccountDAO();
        int id = Integer.parseInt(request.getParameter("BlogID"));
        String key = request.getParameter("key");
        List<BlogDetail> bd = new ArrayList<>();
        if (key.equals("")) {
            bd = b.getBlogDetailById(id);
        } else {
            bd = b.getBlogDetailBySearch(key, id);
        }
        Blog bg = b.getBlogs(id);
        List<Comment> listcm = cd.getCommentByBlogID(id);
        List<Users> user = ad.getAllAccount();

        request.setAttribute("key", key);
        request.setAttribute("blogdetail", bd);
        request.setAttribute("blog", bg);
        request.setAttribute("comment", listcm);
        request.setAttribute("user", user);
        request.getRequestDispatcher("blogdetail.jsp").forward(request, response);
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
        BlogDAO b = new BlogDAO();
        CommentDAO cd = new CommentDAO();
        int BlogID = Integer.parseInt(request.getParameter("BlogID"));
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("account");
        String Comment = request.getParameter("Comment");
        
        Blog bg = b.getBlogs(BlogID);
        cd.addComment(BlogID, u.getUserID(), Comment);
        
        request.setAttribute("blog", bg);
        response.sendRedirect("blogdetail?BlogID="+ bg.getId() +"&key=");
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
