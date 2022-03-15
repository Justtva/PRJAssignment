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
                    + "from [Order] order by date desc";
            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
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

    public ArrayList<Order> getOrdersPaging(int pageindex, int pagesize) {
        ArrayList<Order> orders = new ArrayList<>();
        removeOldOrder();
        try {
            String sql = "SELECT oid, date, earning FROM\n"
                    + "	(SELECT *,ROW_NUMBER() OVER (ORDER BY date desc) as row_index FROM [Order]) tb1\n"
                    + "	 WHERE row_index >= (?-1)*? +1\n"
                    + "	 AND row_index <= ? * ?";
            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
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
    
    public int count() {       
        try {
            String sql = "SELECT COUNT(*) as Total FROM [Order]";
            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    public void removeOldOrder() {
        try {
            String sql = "delete from [Order] where DATEDIFF(DAY,[Order].[date],GETDATE()) > 365";
            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
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
