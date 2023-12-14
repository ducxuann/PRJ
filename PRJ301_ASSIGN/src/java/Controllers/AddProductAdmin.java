/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author win
 */
public class AddProductAdmin extends HttpServlet {

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
            out.println("<title>Servlet AddProductAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductAdmin at " + request.getContextPath() + "</h1>");
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

        DAO dao = new DAO();

        List<Category> listCategory = dao.getAllCategory();

        request.setAttribute("listCategory", listCategory);

        request.getRequestDispatcher("Admin/pages/icons/AddProduct.jsp").forward(request, response);

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


        String productName = request.getParameter("productname");
        String image = request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        int category = Integer.parseInt(request.getParameter("category"));
        int sizeS = Integer.parseInt(request.getParameter("size-s"));
        int sizeM = Integer.parseInt(request.getParameter("size-m"));
        int sizeL = Integer.parseInt(request.getParameter("size-l"));
        int sizeXL = Integer.parseInt(request.getParameter("size-xl"));
        
        DAO dao = new DAO();
        
        dao.insertProduct(productName, image, price, description, category, sizeS, sizeM, sizeL, sizeXL);
        
        response.sendRedirect("productdetail");
        
        
        
        
//        PrintWriter out = response.getWriter();
//        out.println("Product Name: " + productName);
//        out.println("Image: " + image);
//        out.println("Quantity: " + quantity);
//        out.println("Price: " + price);
//        out.println("Description: " + description);
//        out.println("Category: " + category);
//        out.println("Size S: " + sizeS);
//        out.println("Size M: " + sizeM);
//        out.println("Size L: " + sizeL);
//        out.println("Size XL: " + sizeXL);

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
