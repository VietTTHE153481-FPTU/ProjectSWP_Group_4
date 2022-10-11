/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.signup;

import DAO.RegisterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author trung
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String cfpassword = request.getParameter("cfpass");
        String fullname = request.getParameter("fname");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        String email = request.getParameter("mail");
        
        RegisterDAO rd = new RegisterDAO();
        HttpSession session = request.getSession();
        Users a = rd.checkAccountExist(username);
        
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("repassword", cfpassword);
        request.setAttribute("fullname", fullname);
        request.setAttribute("phone", phone);
        request.setAttribute("gender", sex);
        request.setAttribute("email", email);
        //username chi co chu cai in thuong, in hoa hoac chu so
        if (rd.getStringInput(username, "^[a-zA-Z0-9]+$") == false) {
            session.setAttribute("mess", "Username cannot have special character or space");
//            response.sendRedirect("register");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            // check xem username co trung voi username co san khong
        } else if (a != null) {
            session.setAttribute("mess", "The Username already exist!!");
//            response.sendRedirect("register");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            //password phai co it nhat 1 chu so, 1 chu cai in thuong, 1 chu cai in hoa, 1 ki tu dac biet va it nhat tu 5 ki tu tro len 
        } else if (rd.getStringInput(password, "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{5,}$") == false) {
            session.setAttribute("mess", "Password must have at least 1 number, 1 uppercase character, 1 lowercase character, 1 special character and 5 character up and above");
//            response.sendRedirect("register");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            //check xem mat khau nhap lan 2 co trung voi password lan 1 khong
        } else if (!password.equals(cfpassword)) {
            session.setAttribute("mess", "The entered Password must be the same!");
//            response.sendRedirect("register");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            //fullname chi co chu cai in thuong , in hoa va dau cach va ki tu tieng Viet
        } else if (rd.getStringInput(fullname, "^[a-zA-Z"
                + "_ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơ"
                + "ƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊ"
                + "ỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\ ]+$") == false) {
            session.setAttribute("mess", "Full name must be a string of character or Vietnamese character");
//            response.sendRedirect("register");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            // so dien thoai luon bat dau bang so 84 hoac 0 tiep theo la 1 chu so la 3 hoac 5 hoac 7 hoac 8 hoac 9 va tiep theo la 8 chu so
        } else if (rd.getStringInput(phone, "^(84|0[3|5|7|8|9])+([0-9]{8})$") == false) {
            session.setAttribute("mess", "Phone number must match format of Vietnamese phone number format");
//            response.sendRedirect("register");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            //email ki tu dau tien la chu cai tiep theo 
//            la 1 loat ki tu bao gom chu cai hoac chu so tiep theo la dau @ 
//            di cung voi 1 loat ki tu la chu cai di cung voi dau cham theo sau la 
//            1 chuoi ki tu la chu cai chi tu 1 den 3 ki tu
        } else if (rd.getStringInput(email, "^[a-zA-Z][a-zA-Z0-9\\-_]+@[a-zA-Z]+(\\.[a-zA-Z]+){1,3}$") == false) {
            session.setAttribute("mess", "Please input correctly email format");
//            response.sendRedirect("register");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            //đẩy về trang register sau khi thoa man cac dieu kien
            rd.create(username, rd.bytesToHex(password), fullname, phone, sex, email);
            response.sendRedirect("login");
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
