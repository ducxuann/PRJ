/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Attended;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author kienb
 */
public class AttendDBContext extends DBContext {

    public void updateAttend(List<Attended> list) {
        int rid = list.get(0).getRoomid();
        int slotid = list.get(0).getSlotid();
        Timestamp date = list.get(0).getDate();
        try {
            String sql = "delete from Attended where roomid = ? and slotid = ? and [date] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, rid);
            ps.setInt(2, slotid);
            ps.setTimestamp(3, date);
            ps.executeUpdate();
            String xSQL = "INSERT INTO [dbo].[Attended]\n"
                    + "           ([roomid]\n"
                    + "           ,[slotid]\n"
                    + "           ,[date]\n"
                    + "           ,[studentid]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            PreparedStatement ptm = connection.prepareStatement(xSQL);
            for (Attended i : list) {
                ptm.setInt(1, rid); //not sure if String or int or long
                ptm.setInt(2, slotid);
                ptm.setTimestamp(3, date);
                ptm.setInt(4, i.getStudent().getId());
                ptm.setBoolean(5, i.getStatus());
                ptm.addBatch();
            }
            ptm.executeBatch();
        } catch (SQLException e) {
        }
    }
}

