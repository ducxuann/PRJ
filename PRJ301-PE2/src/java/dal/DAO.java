/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Students;

/**
 *
 * @author ADMIN
 */
public class DAO extends DBContext {

    public ArrayList<Students> getAllStudents() {
        ArrayList<Students> sts = new ArrayList<>();
        try {
            String sql = "SELECT s.StudentID, s.StudentName, s.BirthDate, c.ClassName, c.StartDate, i.InstructorName FROM Students s\n"
                    + "JOIN Classes c ON c.ClassID = s.ClassID\n"
                    + "JOIN Instructors i ON i.ClassID = c.ClassID\n"
                    + "ORDER BY StudentID DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Students a = new Students(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getDate(5), rs.getString(6));
                sts.add(a);
            }
        } catch (SQLException ex) {

        }
        return sts;
    }

    //get Array Student -> table
    public ArrayList<Students> getStudentByID(String ID) {
        ArrayList<Students> sts = new ArrayList<>();
        try {
            String sql = "SELECT s.StudentID, s.StudentName, s.BirthDate, c.ClassName, c.StartDate, i.InstructorName FROM Students s\n"
                    + "JOIN Classes c ON c.ClassID = s.ClassID\n"
                    + "JOIN Instructors i ON i.ClassID = c.ClassID\n"
                    + "WHERE StudentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, ID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Students a = new Students(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getDate(5), rs.getString(6));
                sts.add(a);
            }
        } catch (SQLException ex) {

        }
        return sts;
    }

    //get Student by ID -> detail
    public Students getStudentByid(String ID) {
        try {
            String sql = "SELECT DISTINCT s.StudentID, s.StudentName, s.BirthDate, c.ClassName, c.StartDate FROM Students s\n"
                    + "JOIN Classes c ON c.ClassID = s.ClassID\n"
                    + "JOIN Instructors i ON i.ClassID = c.ClassID\n"
                    + "WHERE StudentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, ID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Students a = new Students(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getDate(5));
                return a;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    //get distinct StudentID -> the select
    public ArrayList<Students> getAllStudentsdict() {
        ArrayList<Students> sts = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT s.StudentID, s.StudentName, s.BirthDate, c.ClassName, c.StartDate FROM Students s\n"
                    + "JOIN Classes c ON c.ClassID = s.ClassID\n"
                    + "JOIN Instructors i ON i.ClassID = c.ClassID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Students a = new Students(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getDate(5));
                sts.add(a);
            }
        } catch (SQLException ex) {

        }
        return sts;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        ArrayList<Students> sts = dao.getAllStudentsdict();
        for (Students st : sts) {
            System.out.println(st);
        }
    }
}
