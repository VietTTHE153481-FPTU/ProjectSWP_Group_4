/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.seller;

import DAO.ProductDAO;
import DAO.SubCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Products;
import model.SubCategory;
import model.Users;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddNewProduct", urlPatterns = {"/AddProduct"})
public class AddNewProduct extends HttpServlet {

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
            out.println("<title>Servlet AddNewProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewProduct at " + request.getContextPath() + "</h1>");
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
        SubCategoryDAO sd = new SubCategoryDAO();
        List<SubCategory> subcategories = sd.getAllSubCategory();

        request.setAttribute("subcategories", subcategories);
        request.getRequestDispatcher("newproduct.jsp").forward(request, response);
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
        Users u = (Users) session.getAttribute("account");
        String productName = request.getParameter("productName");
        String Description = request.getParameter("Description");
        double OriginalPrice = Double.parseDouble(request.getParameter("OriginalPrice"));
        double SellPrice = Double.parseDouble(request.getParameter("SellPrice"));
        int SubCategoryID = Integer.parseInt(request.getParameter("SubCategoryID"));
        int Amount = Integer.parseInt(request.getParameter("Amount"));
        String image = request.getParameter("image");
        
        ProductDAO pd = new ProductDAO();
        pd.insert(productName, Description, OriginalPrice, SellPrice, 100 - (SellPrice / OriginalPrice * 100), SubCategoryID, u.getShopId(), Amount);
        Products pnew = pd.getInsertProduct(u.getShopId());
        pd.insertProductImg(pnew.getProductID(), image);
        request.setAttribute("err", "Add Succesfully!");
        request.getRequestDispatcher("newproduct.jsp").forward(request, response);

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
