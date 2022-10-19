/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import DAO.HelpDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.HelpCenter;
import model.HelpContent;
import model.HelpTitle;

/**
 *
 * @author trung
 */
@WebServlet(name = "ServiceListServlet", urlPatterns = {"/servicecategories"})
public class ServiceListServlet extends HttpServlet {

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
            out.println("<title>Servlet ServiceListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServiceListServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        HelpDAO hd = new HelpDAO();
        List<HelpCenter> help = hd.getAllHelpCenter();
        request.setAttribute("category", help);

        List<HelpTitle> title = hd.getAllHelpTitle();
        request.setAttribute("listservice", title);

        //String page_raw = request.getParameter("page");
        String seid_raw = request.getParameter("seid");
        String stid_raw = request.getParameter("stid");
        int seid, stid;

        //page = (page_raw == null) ? 0 : Integer.parseInt(page_raw);
        seid = (seid_raw == null) ? 0 : Integer.parseInt(seid_raw);
        stid = (stid_raw == null) ? 0 : Integer.parseInt(stid_raw);

        //request.setAttribute("page", page_raw);
        request.setAttribute("seid", seid_raw);
        request.setAttribute("stid", stid_raw);

        String key = request.getParameter("key");
        List<HelpContent> content = new ArrayList<>();
        if (key.equals("")) {
            content = hd.getHelpContentByID(seid, stid);
        } else {
            content = hd.getHelpContentBySearch(seid, stid, key);
        }

        /*
        int maxContentDisplay = 12;

        int maxPage = (int) Math.ceil((content.size() * 1.0) / maxContentDisplay);
        request.setAttribute("maxPage", maxPage);

        List<HelpContent> display = new ArrayList<>();

        for (int i = maxContentDisplay * (page - 1); i < maxContentDisplay * page; i++) {
            if (i < content.size()) {
                display.add(content.get(i));
            }
        }
         */
        HelpTitle ht = hd.getHelpTitle(stid);

        request.setAttribute("listContentByStId", content);
        request.setAttribute("title", ht);
        request.setAttribute("tag1", seid_raw);
        request.setAttribute("tag2", stid_raw);
        request.getRequestDispatcher("listservice.jsp").forward(request, response);
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
        request.getRequestDispatcher("listservice.jsp").forward(request, response);
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
