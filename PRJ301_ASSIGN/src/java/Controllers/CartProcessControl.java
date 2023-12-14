/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Account;
import Models.Cart;
import Models.CartItems;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author win
 */
public class CartProcessControl extends HttpServlet {

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

        DAO dao = new DAO();

        HttpSession session = request.getSession();
        Account ad = (Account) session.getAttribute("acc");
        request.setAttribute("ad", ad);
        List<Product> list = dao.getAllProduct();
        Cookie[] c = request.getCookies();
        String str = "";
        if (c != null) {
            for (Cookie cookie : c) {
                if (cookie.getName().equals("cart")) {
                    str += cookie.getValue();
//                    cookie.setMaxAge(0);
//                    response.addCookie(cookie);
                }
            }
        }

        Cart cart = new Cart(str, list);
        String id_raw = request.getParameter("id");
        String num_raw = request.getParameter("num");
        String size_raw = request.getParameter("s");

        int id, num = 0;

        try {
            id = Integer.parseInt(id_raw);
            Product p = dao.getProductByID(id);
            int numStore = p.getCount();
            num = Integer.parseInt(num_raw);
            if (num == -1 && (cart.getCount(id) <= 1)) {
//                cart.removeItem(id);
            } else {
                if (num == 1 && cart.getCount(id) >= numStore) {
                    num = 0;
                }
                int price = p.getPrice();
                CartItems t = new CartItems(p, price, num, size_raw);
                cart.addItem(t);
            }
        } catch (Exception e) {

        }

        List<CartItems> items = cart.getItems();
        str = "";
        if (items.size() > 0) {
            str = items.get(0).getProduct().getId() + ":" + items.get(0).getQuanity() + ":" + items.get(0).getSize();
            for (int i = 1; i < items.size(); i++) {
                str += "+" + items.get(i).getProduct().getId() + ":" + items.get(i).getQuanity() + ":" + items.get(i).getSize();
            }
        }

        Cookie cs = new Cookie("cart", str);
        cs.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(cs);

        request.setAttribute("countItemCart", items.size());
        request.setAttribute("cart", cart);

        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
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
        Account ad = (Account) session.getAttribute("acc");
        request.setAttribute("ad", ad);
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        Cookie[] arr = request.getCookies();
        String str = "";
        if (arr != null) {
            for (Cookie cookie : arr) {
                if (cookie.getName().equals("cart")) {
                    str += cookie.getValue();
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }
        String id = request.getParameter("idx");
        String sizex = request.getParameter("sizex");
        String[] ids = str.split("\\+");
        String out = "";
        for (int i = 0; i < ids.length; i++) {
            String[] s = ids[i].split(":");
            if (!(s[0].equals(id) && s[2].equals(sizex))) {
                if (out.isEmpty()) {
                    out = ids[i];
                } else {
                    out += "+" + ids[i];
                }
            }
        }
        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);
        }
        Cart cart = new Cart(out, list);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
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
