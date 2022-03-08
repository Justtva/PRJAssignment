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
}
