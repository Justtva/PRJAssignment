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

/**
 *
 * @author Bi
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> getProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select pid, pname, import_price, sell_price, quantity from Products";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setImport_price(rs.getFloat("import_price"));
                p.setSell_price(rs.getFloat("sell_price"));
                p.setQuantity(rs.getInt("quantity"));
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

    public void updateProduct(Product p) {
        String sql = "UPDATE [Products]\n"
                + "   SET"
                + "      [pname] = ?\n"
                + "      ,[import_price] = ?\n"
                + "      ,[sell_price] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE [pid]=?";

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(5, p.getId());
            stm.setString(1, p.getName());
            stm.setFloat(2, p.getImport_price());
            stm.setFloat(3, p.getSell_price());
            stm.setInt(4, p.getQuantity());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
