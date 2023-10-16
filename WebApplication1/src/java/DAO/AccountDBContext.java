/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import Model.Attended;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kienb
 */
public class AccountDBContext extends DBContext {

    public Account getAccountByEmail(String email) {
        try {
            Account acc = new Account();
            String sql = "Select * from Account where email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc.setId(rs.getInt(1));
                acc.setEmail(rs.getString(2));
                acc.setPassword(rs.getString(3));
                acc.setIsTeacher(rs.getBoolean(4));
                return acc;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Attended> getAllAccountByClass(int rid, int sid, Timestamp date) {
        try {
            List<Attended> list = new ArrayList<>();
            String sql = "Select * from Account a join (Select * from Account_Class) ac on a.id = ac.AccountID \n"
                    + "join (Select * from [Session] where slotid = ? and roomid = ? and [date] = ? ) se on se.classID = ac.ClassID and se.courseid = ac.CourseID \n"
                    + "left join (Select * from Attended) [at] on [at].roomid = se.roomid and [at].slotid = se.slotid \n"
                    + "and [at].[date] = se.[date] and a.id = [at].studentid";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sid);
            ps.setInt(2, rid);
            ps.setTimestamp(3, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Attended att = new Attended();
                att.setRoomid(rid);
                att.setSlotid(sid);
                att.setDate(date);
                att.setStatus(rs.getObject("status") == null ? null : rs.getBoolean("status"));
                Account acc = getAccountByEmail(rs.getString(2));
                att.setStudent(acc);
                list.add(att);
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }
}
