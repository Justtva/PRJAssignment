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
import model.Order;
import model.Product;

/**
 *
 * @author Bi
 */
public class OrderDBContext extends DBContext {

    public ArrayList<Order> getOrders() {
        ArrayList<Order> orders = new ArrayList<>();
        removeOldOrder();
        try {          
            String sql = "select oid, date, earning\n"
                    + "from [Order]";
            PreparedStatement stm = null;
            stm=connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                Order o = new Order();
                o.setId(rs.getInt("oid"));
                o.setDate(rs.getDate("date"));
                o.setEarning(rs.getFloat("earning"));
                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    public void removeOldOrder(){
        try {          
            String sql = "delete from [Order] where DATEDIFF(DAY,[Order].[date],GETDATE()) > 365";
            PreparedStatement stm = null;
            stm=connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertOrder(Order o) {
        try {
            String sql = "INSERT INTO [Order]\n"
                    + "           ([date]\n"
                    + "           ,[earning])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";

            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            stm.setDate(1, o.getDate());
            stm.setFloat(2, o.getEarning());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
