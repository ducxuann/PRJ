/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Account;
import Models.AccountRg;
import Models.Md5;
import Models.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author win
 */
public class SignUpControl extends HttpServlet {

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
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String veryPassword = request.getParameter("veryPassword");
            String security = request.getParameter("security");
            String email = request.getParameter("email");
            int isAdmin = 0;

            String err = "";

            SendMail sm = new SendMail();
            String otp = sm.generateOTP();

            if (!password.equals(veryPassword)) {
                err += "Mật khẩu không trùng khớp";
                request.setAttribute("err", err);
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            } else {
                DAO dao = new DAO();
                Account a = dao.checkAccountExist(userName);
                if (a == null) {
                    AccountRg arg = new AccountRg(firstName, lastName, userName, password, security, email, otp, isAdmin);
                    boolean test = sm.send(arg);
                    if (test) {
                        HttpSession session = request.getSession();
                        session.setAttribute("authotp", arg);
                        request.getRequestDispatcher("../Verify.jsp").forward(request, response);
                    }
                } else {
                    err += "Tài khoản đã tồn tại.";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                    response.sendRedirect("../LoadDB");
                }
            }
        }
//        catch (NoSuchAlgorithmException e){
//        
//    }
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
        processRequest(request, response);
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
