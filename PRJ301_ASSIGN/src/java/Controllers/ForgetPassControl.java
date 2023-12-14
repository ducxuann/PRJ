package Controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import DAL.DAO;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author win
 */
public class ForgetPassControl extends HttpServlet {
   
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
        String username = request.getParameter("username");
        String pin = request.getParameter("security");
        String newpass = request.getParameter("newPass");
        String confpass = request.getParameter("confirmPass");
        
        String err = "";
        
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        Account a = dao.checkAccountExist(username);
        String security = dao.checkAccountExist(username).getSecurity();
        if(a != null && pin.equals(security)){
           out.println("<html>    <style>\n" +
"        /* Styling the Body element i.e. Color,\n" +
"		Font, Alignment */\n" +
"        \n" +
"        body {\n" +
"            background-color: #fafbfd;\n" +
"            font-family: Verdana;\n" +
"            text-align: center;\n" +
"        }\n" +
"\n" +
"        /* Styling the Form (Color, Padding, Shadow) */\n" +
"        form {\n" +
"            background-color: #fff;\n" +
"            max-width: 500px;\n" +
"            margin: 50px auto;\n" +
"            padding: 30px 20px;\n" +
"            box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);\n" +
"        }\n" +
"\n" +
"        /* Styling form-control Class */\n" +
"        .form-control {\n" +
"            text-align: left;\n" +
"            margin-bottom: 25px;\n" +
"        }\n" +
"\n" +
"        /* Styling form-control Label */\n" +
"        .form-control label {\n" +
"            display: block;\n" +
"            margin-bottom: 10px;\n" +
"        }\n" +
"\n" +
"        /* Styling form-control input,\n" +
"		select, textarea */\n" +
"        .form-control input,\n" +
"        .form-control select,\n" +
"        .form-control textarea {\n" +
"            border: 1px solid #777;\n" +
"            border-radius: 2px;\n" +
"            font-family: inherit;\n" +
"            padding: 10px;\n" +
"            display: block;\n" +
"            width: 95%;\n" +
"        }\n" +
"\n" +
"        /* Styling form-control Radio\n" +
"		button and Checkbox */\n" +
"        .form-control input[type=\"radio\"],\n" +
"        .form-control input[type=\"checkbox\"] {\n" +
"            display: inline-block;\n" +
"            width: auto;\n" +
"        }\n" +
"\n" +
"        /* Styling Button */\n" +
"        button {\n" +
"            background-color: #05c46b;\n" +
"            border: 1px solid #777;\n" +
"            border-radius: 2px;\n" +
"            font-family: inherit;\n" +
"            font-size: 21px;\n" +
"            display: block;\n" +
"            width: 100%;\n" +
"            margin-top: 50px;\n" +
"            margin-bottom: 20px;\n" +
"        }\n" +
"    </style>"+"<!--ShowForm-->\n" +
"        <form id=\"form\" method=\"post\" action=\"fpass\" style>\n" +
"\n" +
"        <!-- Details -->\n" +
"               <input type=\"hidden\" name=\"username\" value="+username+">"+
"        <div class=\"form-control\" style=\"border: 0px; margin-bottom: 0px;\">\n" +
"            <label for=\"name\" id=\"label-name\">\n" +
"                New Password\n" +
"            </label>\n" +
"\n" +
"            <!-- Input Type Text -->\n" +
"            <input class=\"form-control\" type=\"password\" style=\"margin-bottom: 10px;\" placeholder=\"New Pass\" name=\"newPass\"   required/>\n" +
"        </div>\n" +
"        \n" +
"        <div class=\"form-control\" style=\"border: 0px; margin-bottom: 0px;\">\n" +
"            <label for=\"email\" id=\"label-email\">\n" +
"                Confirm New Password\n" +
"            </label>\n" +
"\n" +
"            <!-- Input Type Email-->\n" +
"            <input type=\"password\" name=\"confirmPass\" placeholder=\"Confirm New Password\" required/>\n" +
"        </div>\n" +
"\n" +
"       \n" +
"        \n" +
"        <!-- Multi-line Text Input Control -->\n" +
"        <button type=\"submit\" style=\"cursor: pointer; color: white; font-weight: 600;\">\n" +
"            CHANGE\n" +
"        </button>\n" +
"    </form>"+"</html>");
//           request.getRequestDispatcher("fpass").forward(request, response);
        } else {
            
                err+="Username hoặc mã PIN sai";
                request.setAttribute("err", err);
//                response.sendRedirect("ForgetPass.jsp");
                request.getRequestDispatcher("ForgetPass.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
