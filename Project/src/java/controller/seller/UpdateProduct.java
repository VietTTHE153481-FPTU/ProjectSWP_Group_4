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
import java.text.DecimalFormat;
import java.util.List;
import model.Products;
import model.SubCategory;
import model.UserStatus;
import model.Users;

/**
 *
 * @author admin
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet UpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
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
        SubCategoryDAO sd = new SubCategoryDAO();
        List<SubCategory> subcategories = sd.getAllSubCategory();
        String raw_id = request.getParameter("id");
        try {
            int id = Integer.parseInt(raw_id);
            Products p = pd.getProductById(id);
            request.setAttribute("product", p);
            request.setAttribute("subcategories", subcategories);
            request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
        } catch (Exception ex) {
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
        HttpSession session = request.getSession();
        Users u= (Users) session.getAttribute("account");
        DecimalFormat f = new DecimalFormat("##.0");
        String name= request.getParameter("name");
        String description = request.getParameter("description");
        String raw_originalprice= request.getParameter("originalprice");
        String raw_sellprice= request.getParameter("sellprice");
        String raw_amount = request.getParameter("amount");
        String raw_subcategory= request.getParameter("subcategory");
        
        try{
            ProductDAO pd= new ProductDAO();            
            double originalprice= Double.parseDouble(raw_originalprice);
            double sellprice= Double.parseDouble(raw_sellprice);
            int amount= Integer.parseInt(raw_amount);
            int subcategory= Integer.parseInt(raw_subcategory);
            String raw_salepercent= f.format(sellprice/originalprice*100);
            double salepercent= Double.parseDouble(raw_salepercent);
            Products p= new Products();
            p.setProductName(name);
            p.setOriginalPrice(originalprice);
            p.setDescription(description);
            p.setSellPrice(sellprice);
            p.setSalePercent(salepercent);
            p.setAmount(amount);
            p.setSubCategoryID(subcategory);
            p.setShopID(u.getShopId());
            pd.insert(p);
            request.setAttribute("err","Update Succesfully!");
            request.getRequestDispatcher("newproduct.jsp").forward(request, response);
        }catch(NumberFormatException ex){
            System.out.println(ex);
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
