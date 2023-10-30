/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RoomDBContext;
import DAO.SessionDBContext;
import DAO.SlotDBContext;
import Model.Room;
import Model.Session;
import Model.Slot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author kienb
 */
public class ChangeSessionController extends HttpServlet {

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

        String sid = request.getParameter("sid");
        String slid = request.getParameter("slid");
        String date = request.getParameter("date");
        LocalDate localDate = LocalDate.parse(date);
        Timestamp timestamp = Timestamp.valueOf(localDate.atStartOfDay());
        SessionDBContext sdb = new SessionDBContext();
        Session s = sdb.getSession(Integer.parseInt(sid), Integer.parseInt(slid), timestamp);
        SlotDBContext sdc = new SlotDBContext();
        List<Slot> listSlot = sdc.getAllSlot();
        RoomDBContext rdb = new RoomDBContext();
        List<Room> listRoom = rdb.getAllRoom();
        request.setAttribute("slots", listSlot);
        request.setAttribute("rooms", listRoom);
        request.setAttribute("detail", s);
        request.setAttribute("date", s.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        request.getRequestDispatcher("ChangeSession.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        if (action.equals("Cancel")) {
            response.sendRedirect("weeklyTable");
            return;
        }
        SessionDBContext sdb = new SessionDBContext();
        String sid = request.getParameter("sid");
        String slid = request.getParameter("slid");
        String date = request.getParameter("date");
        String newsid = request.getParameter("newsid");
        String newslid = request.getParameter("newslid");
        String newdate = request.getParameter("newdate");
        LocalDate localDate = LocalDate.parse(date);
        Timestamp timestamp = Timestamp.valueOf(localDate.atStartOfDay());
        LocalDate newlocalDate = LocalDate.parse(newdate);
        Timestamp newtimestamp = Timestamp.valueOf(newlocalDate.atStartOfDay());
        Session s = sdb.getSession(Integer.parseInt(sid), Integer.parseInt(slid), timestamp);
        SlotDBContext sdc = new SlotDBContext();
        List<Slot> listSlot = sdc.getAllSlot();
        RoomDBContext rdb = new RoomDBContext();
        List<Room> listRoom = rdb.getAllRoom();
        request.setAttribute("slots", listSlot);
        request.setAttribute("rooms", listRoom);
        request.setAttribute("detail", s);
        request.setAttribute("date", s.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (newlocalDate.isBefore(localDate)) {
            request.setAttribute("error", "Không đổi sang được ngày này. Mời bạn chọn lại ngày khác");
            request.getRequestDispatcher("ChangeSession.jsp").forward(request, response);
            return;
        }
        boolean check = sdb.updateSession(Integer.parseInt(sid), Integer.parseInt(slid), timestamp, Integer.parseInt(newsid),
                Integer.parseInt(newslid), newtimestamp);
        if (!check) {
            request.setAttribute("error", "Không đổi sang được ngày này. Mời bạn chọn lại ngày khác");
            request.getRequestDispatcher("ChangeSession.jsp").forward(request, response);
        } else {
            response.sendRedirect("weeklyTable");
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
