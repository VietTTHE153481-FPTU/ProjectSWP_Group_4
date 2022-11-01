/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.signup;

import DAO.AccountDAO;
import DAO.MessagesDAO;
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
import model.Messages;
import model.Messages_group;
import model.Users;

/**
 *
 * @author Minhm
 */
@WebServlet(name = "ChatServlet", urlPatterns = {"/ChatServlet"})
public class ChatServlet extends HttpServlet {

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
            out.println("<title>Servlet ChatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChatServlet at " + request.getContextPath() + "</h1>");
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
        MessagesDAO dao = new MessagesDAO();
        AccountDAO dao2 = new AccountDAO();
        Users a = (Users) session.getAttribute("account");
        int id1 = a.getUserID();
        List<Messages_group> lmao = new ArrayList<>();
        if (request.getParameter("gid") == null) {
            List<Users> a2 = dao2.getAllAccount();

            int id2;
            if (request.getParameter("id") == null) {
                id2 = Integer.parseInt(request.getParameter("uid"));
            } else {
                int shopid = Integer.parseInt(request.getParameter("id"));
                id2 = dao2.getSellerByShopID(shopid).getUserID();
            }

            session.setAttribute("talkingwithid", id2);
            session.setAttribute("talkingwithname", dao2.getUserByID(id2));

            if (id1 == id2) {
                request.getRequestDispatcher("home").forward(request, response);
                return;
            }
            int room = dao.CheckForExistingInbox(id1, id2);

            if (room != -1) {
                lmao = dao.GetAllGroupListOfUsers(id1);
                if (lmao != null) {
                    for (Messages_group lemao : lmao) {
                        if (lemao.getGroup_ID() == room) {
                            request.setAttribute("chatbox", lemao);
                            break;
                        }
                    }
                    request.setAttribute("chatnavi", lmao);
                    request.getRequestDispatcher("chat.jsp").forward(request, response);
                    return;
                }
            } else {
                int[] memberID = {id1, id2};
                dao.newRoom(memberID, null);
                lmao = dao.GetAllGroupListOfUsers(id1);
                if (lmao != null) {
                    request.setAttribute("chatnavi", lmao);
                    response.sendRedirect("viewChat");
                    return;
                }
            }
        } else {
            int groupID = Integer.parseInt(request.getParameter("gid"));
            int id2 = dao.getOp(groupID, a.getUserID());
            session.setAttribute("talkingwithid", id2);
            session.setAttribute("talkingwithname", dao2.getUserByID(id2));
            response.sendRedirect("ChatServlet?uid=" + id2);
            return;
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
        MessagesDAO dao = new MessagesDAO();
        AccountDAO dao2 = new AccountDAO();
        HttpSession session = request.getSession();
        String message = request.getParameter("text");
        int room = Integer.parseInt(request.getParameter("room"));
        Users a = (Users) session.getAttribute("account");
        int uID = a.getUserID();
        dao.SaveNewMessage(room, message, uID);
        int id2 = dao.getOp(room, uID);
        response.sendRedirect("ChatServlet?uid=" + id2);
        return;

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
