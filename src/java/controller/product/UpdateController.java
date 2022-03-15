/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.product;

import dal.ProductDBContext;
import dal.ShipperDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.Shipper;

/**
 *
 * @author Bi
 */
public class UpdateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDBContext pdb = new ProductDBContext();
        Product p = pdb.getProduct(id);
        ShipperDBContext sdb = new ShipperDBContext();
        ArrayList<Shipper> shippers = sdb.getShippers();
        request.setAttribute("shippers", shippers);
        request.setAttribute("product", p);
        request.getRequestDispatcher("../updateproduct.jsp").forward(request, response);
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
        String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_import_price = request.getParameter("import_price");
        String raw_sell_price = request.getParameter("sell_price");
        String raw_sid = request.getParameter("sid");
        String raw_import_date = request.getParameter("import_date");
        String raw_expire_date = request.getParameter("expire_date");
        String raw_quantity = request.getParameter("quantity");

        //validate data
        int id = Integer.parseInt(raw_id);
        int sid = Integer.parseInt(raw_sid);
        String name = raw_name;
        float import_price = Float.parseFloat(raw_import_price);
        float sell_price = Float.parseFloat(raw_sell_price);
        Date import_date = Date.valueOf(raw_import_date);
        Date expire_date = Date.valueOf(raw_expire_date);
        int quantity = Integer.parseInt(raw_quantity);

        Shipper s = new Shipper();
        s.setId(sid);
        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setImport_price(import_price);
        p.setSell_price(sell_price);
        p.setShipper(s);
        p.setImportDate(import_date);
        p.setExpireDate(expire_date);
        p.setQuantity(quantity);

        ProductDBContext db = new ProductDBContext();
        db.updateProduct(p);
        
        response.sendRedirect("detaillist");
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
