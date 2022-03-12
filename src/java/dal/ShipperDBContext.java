/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Shipper;

/**
 *
 * @author Bi
 */
public class ShipperDBContext extends DBContext {

    public ArrayList<Shipper> getShippers() {
        ArrayList<Shipper> shippers = new ArrayList<>();
        try {
            String sql = "select  sid, sname, snumber, saddress from Shipper";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shipper s = new Shipper();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setNumber(rs.getString("snumber"));
                s.setAddress(rs.getString("saddress"));
                shippers.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return shippers;
    }

    public Shipper getAShipper(int id) {
        try {
            String sql = "SELECT sname, snumber, saddress, sid FROM Shipper\n"
                    + "WHERE sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Shipper s = new Shipper();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setNumber(rs.getString("snumber"));
                s.setAddress(rs.getString("saddress"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertShipper(Shipper s) {
        try {
            String sql = "INSERT INTO [Shipper]\n"
                    + "           ([sname]\n"
                    + "           ,[snumber]\n"
                    + "           ,[saddress]\n"
                    + "           ,[sid])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)\n"
                    + "\n"
                    + "";

            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            stm.setString(1, s.getName());
            stm.setString(2, s.getNumber());
            stm.setString(3, s.getAddress());
            stm.setInt(4, s.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
