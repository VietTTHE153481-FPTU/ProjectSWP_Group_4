/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.signup;

import DAO.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.EmailUtility;
import java.util.Random;


/**
 *
 * @author admin
 */
@WebServlet(name="ResetServlet", urlPatterns={"/reset"})
public class ResetServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ResetServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AccountDAO ad= new AccountDAO();
        HttpSession session= request.getSession();
        String email= request.getParameter("mail");
        if(ad.getAccByEmail(email)==null){
            request.setAttribute("mess", "Invalid email! Please try again!");
            request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
        }else{
            String host = "smtp.gmail.com";
            String port = "587";
            String senderName = "Lavender Shop";
            String senderEmail = "thailshe160614@fpt.edu.vn";
            String senderPassword = "fzpulqmyhwcbyhzu";
            String subject = "Your Password has been reset";

            String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
            String specialCharacters = "!@#$";
            String numbers = "1234567890";
            String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
            Random random = new Random();
            String newPassword ="";
            newPassword += capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
            newPassword += lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
            newPassword += specialCharacters.charAt(random.nextInt(specialCharacters.length()));
            newPassword += numbers.charAt(random.nextInt(numbers.length()));
            for (int i = 4; i < 8; i++) {
                newPassword += combinedChars.charAt(random.nextInt(combinedChars.length()));
            }

            String content = "Hi, this is your new password: '" + newPassword + "'";
            content += "\nNote: for security reason, "
                    + "you must change your password after logging in.";

            String message = "";

            try {
                EmailUtility eu= new EmailUtility();
                eu.sendEmail(host, port, senderEmail, senderName, senderPassword,
                        email, subject, content);
                message = "Your password has been reset. Please check your e-mail.";
                ad.changePass(ad.getAccByEmail(email).getUsername(), newPassword);
            } catch (Exception ex) {
                ex.printStackTrace();
                message = "There were an error: " + ex.getMessage();
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
