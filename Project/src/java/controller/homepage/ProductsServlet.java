/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import DAO.BrandDAO;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.SubCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Category;
import model.Products;
import model.SubCategory;

/**
 *
 * @author trung
 */
@WebServlet(name = "ProductsServlet", urlPatterns = {"/products"})
public class ProductsServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cdao = new CategoryDAO();
        List<Category> categorys = cdao.getAll();
        request.setAttribute("categorys", categorys);

        SubCategoryDAO scdao = new SubCategoryDAO();
        List<SubCategory> subcategorys = scdao.getAllSubCategory();
        request.setAttribute("subcategorys", subcategorys);

        BrandDAO bdao = new BrandDAO();
        List<Brand> brands = bdao.getAllBrand();
        request.setAttribute("brands", brands);

        ProductDAO pd = new ProductDAO();

        String page_raw = request.getParameter("page");
        String key = request.getParameter("key");
        String cid_raw = request.getParameter("cid");
        String sid_raw = request.getParameter("sid");
        String sortType_raw = request.getParameter("sortType");
        String sortMode_raw = request.getParameter("sortMode");
        int page, cid, sid, sortType, sortMode;

        page = (page_raw == null) ? 0 : Integer.parseInt(page_raw);
        cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
        sid = (sid_raw == null) ? 0 : Integer.parseInt(sid_raw);
        sortType = (sortType_raw == null) ? 0 : Integer.parseInt(sortType_raw);
        sortMode = (sortMode_raw == null) ? 0 : Integer.parseInt(sortMode_raw);

        request.setAttribute("page", page_raw);
        request.setAttribute("key", key.replace(' ', '+'));
        request.setAttribute("cid", cid_raw);
        request.setAttribute("sid", sid_raw);
        request.setAttribute("sortType", sortType_raw);
        request.setAttribute("sortMode", sortMode_raw);

        List<Products> products = pd.getProductByCid(key, cid, sid, sortType, sortMode);

        int maxProductDisplay = 12;
        
        int maxPage = (int) Math.ceil((products.size() * 1.0) / maxProductDisplay);
        request.setAttribute("maxPage", maxPage);
        List<Products> display = new ArrayList<>();
        for (int i = maxProductDisplay * (page - 1); i < maxProductDisplay * page; i++) {
            if (i < products.size()) {
                display.add(products.get(i));
            }
        }

        request.setAttribute("listPdByCid", display);
        request.setAttribute("tag", cid_raw);
        request.getRequestDispatcher("products.jsp").forward(request, response);
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
