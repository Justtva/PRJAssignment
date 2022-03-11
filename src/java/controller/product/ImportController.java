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
import java.time.LocalDate;
import java.time.LocalDateTime;
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
public class ImportController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
     * //
     * <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
     * /**
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
        ShipperDBContext db = new ShipperDBContext();
        ArrayList<Shipper> shippers = db.getShippers();
        request.setAttribute("shippers", shippers);  
        request.getRequestDispatcher("../import.jsp").forward(request, response);
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
        String raw_pname = request.getParameter("pname");
        String raw_import_price = request.getParameter("import_price");
        String raw_quantity = request.getParameter("quantity");
        String raw_export_price = request.getParameter("sell_price");
        String raw_expire_date = request.getParameter("expired_date");
        String raw_sid = request.getParameter("sid");
        
        ProductDBContext db = new ProductDBContext();
        ArrayList<Product> products = new ArrayList<>();
        int pid = 
        
        
        long millis=System.currentTimeMillis();
        String pname = raw_pname;
        float import_price = Float.parseFloat(raw_import_price);
        int quantity = Integer.parseInt(raw_quantity);
        float export_price = Float.parseFloat(raw_export_price);
        Date import_date = new Date(millis);
        Date expire_date = Date.valueOf(raw_expire_date);
        int sid = Integer.parseInt(raw_sid);
        
        Shipper s = new Shipper();
        s.setId(sid);
        Product p = new Product();
        p.setShipper(s);
        p.setId(pid);
        p.setName(pname);
        p.setImport_price(import_price);
        p.setQuantity(quantity);
        p.setSell_price(export_price);
        p.setImportDate(import_date);
        p.setExpireDate(expire_date);
        
        db.importProduct(p);
        response.sendRedirect("../list");
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
