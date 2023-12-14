/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Account;
import Models.Md5;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 *
 * @author Tran Hieu
 */
public class AdminLoginControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String userName = request.getParameter("username");
            String passWord = request.getParameter("password");
            DAO dao = new DAO();
            Md5 md5 = new Md5();
            Account a = dao.login(userName, md5.getHashPass(passWord));
            String notify = "";
//            out.println("<h1>"+a.getIsAdmin()+"</h1>");
            if (a != null) {
                if (a.getIsAdmin()==0) {
                    notify = "Không có quyền truy cập!";
                    request.setAttribute("notify", notify);
                    request.getRequestDispatcher("Loginadmin.jsp").forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("acc", a);
                    request.getRequestDispatcher("admin").forward(request, response);
                }
            } else {
                notify = "Username hoặc Password sai!";
                request.setAttribute("notify", notify);
                request.getRequestDispatcher("Loginadmin.jsp").forward(request, response);
            }
        } catch (NoSuchAlgorithmException e) {
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
