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
import model.Product;
import model.Shipper;

/**
 *
 * @author Bi
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> getProducts() {

        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT pid, pname, import_price, sell_price, quantity, import_date, expire_date, sid\n"
                    + "FROM [Product]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setImport_price(rs.getFloat("import_price"));
                p.setSell_price(rs.getFloat("sell_price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImportDate(rs.getDate("import_date"));
                p.setExpireDate(rs.getDate("expire_date"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getProductsBySid(int sid) {
        ArrayList<Product> products = new ArrayList<>();
        removeProduct();
        try {
            String sql = "select pid, pname, import_price, sell_price, quantity, import_date, expire_date, p.sid, s.sname, s.saddress, s.snumber\n"
                    + "from Product p inner join Shipper s\n"
                    + "on p.sid = s.sid\n";
            if (sid != -1) {
                sql += "where p.sid = ?";
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            if (sid != -1) {
                stm.setInt(1, sid);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Shipper s = new Shipper();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setAddress(rs.getString("saddress"));
                s.setNumber(rs.getString("snumber"));
                p.setShipper(s);
                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setImport_price(rs.getFloat("import_price"));
                p.setSell_price(rs.getFloat("sell_price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImportDate(rs.getDate("import_date"));
                p.setExpireDate(rs.getDate("expire_date"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Product getProduct(int id) {
        ArrayList<Product> products = getProducts();
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public void removeProduct() {
        try {
            String sql = "delete from [Product] where [Product].[quantity]<=0";
            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE [Product]\n"
                + "   SET [pname] = ?\n"
                + "      ,[import_price] = ?\n"
                + "      ,[sell_price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[import_date] = ?\n"
                + "      ,[expire_date] = ?\n"
                + "      ,[sid] = ?\n"
                + " WHERE [pid] = ?";

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(8, p.getId());
            stm.setString(1, p.getName());
            stm.setFloat(2, p.getImport_price());
            stm.setFloat(3, p.getSell_price());
            stm.setInt(4, p.getQuantity());
            stm.setDate(5, p.getImportDate());
            stm.setDate(6, p.getExpireDate());
            stm.setInt(7, p.getShipper().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void importProduct(Product p) {
        try {
            String sql = "INSERT INTO [Product]\n"
                    + "           ([pname]\n"
                    + "           ,[import_price]\n"
                    + "           ,[sell_price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[import_date]\n"
                    + "           ,[expire_date]\n"
                    + "           ,[sid])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            stm.setString(1, p.getName());
            stm.setFloat(2, p.getImport_price());
            stm.setFloat(3, p.getSell_price());
            stm.setInt(4, p.getQuantity());
            stm.setDate(5, p.getImportDate());
            stm.setDate(6, p.getExpireDate());
            stm.setInt(7, p.getShipper().getId());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
