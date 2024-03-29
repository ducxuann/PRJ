/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Tran Hieu
 */
public class ProcessEditProductAdmin extends HttpServlet {

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
            DAO dao = new DAO();

            int id = Integer.parseInt(request.getParameter("id"));
            int price = Integer.parseInt(request.getParameter("price"));
            int cateID = Integer.parseInt(request.getParameter("category"));
            int sizeS = Integer.parseInt(request.getParameter("size-S"));
            int sizeM = Integer.parseInt(request.getParameter("size-M"));
            int sizeL = Integer.parseInt(request.getParameter("size-L"));
            int sizeXL = Integer.parseInt(request.getParameter("size-XL"));

            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String description = request.getParameter("description");

//            
//            out.println(id);
//            out.println(name);
//            out.println(image);
//            out.println(price);
//            out.println(title);
//            out.println(description);
//            out.println(category);
//            out.println(sell_ID);
//            out.println(count);
//            
            dao.editProductAdmin(id, name, image, price, description, cateID, sizeS, sizeM, sizeL, sizeXL);

            response.sendRedirect("productdetail");

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
