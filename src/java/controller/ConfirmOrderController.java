/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author Bi
 */
public class ConfirmOrderController extends BaseAuthController {

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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Order order = (Order) request.getSession().getAttribute("order");
        ProductDBContext productDB = new ProductDBContext();
        OrderDBContext orderDB = new OrderDBContext();
        ArrayList<Product> products = productDB.getProductsBySid(-1);
        float earning = 0;
        for (Product product : products) {
            for (OrderDetail detail : order.getDetails()) {
                if(detail.getProduct().getName().equals(product.getName()) && (product.getQuantity() - detail.getQuantity())<0){
                    request.setAttribute("alertMsg", "Số lượng bán vượt quá số lượng còn");
                }else if (detail.getProduct().getName().equals(product.getName())) {
                    product.setId(product.getId());
                    product.setName(product.getName());
                    product.setImport_price(product.getImport_price());
                    product.setSell_price(product.getSell_price());
                    product.setQuantity(product.getQuantity() - detail.getQuantity());
                    product.setExpireDate(product.getExpireDate());
                    product.setImportDate(product.getImportDate());
                    product.setShipper(product.getShipper());
                    productDB.updateProduct(product);
                    earning+=(product.getEarning())*detail.getQuantity();
                }
            }
        }
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        order.setDate(date);
        order.setEarning(earning);
        orderDB.insertOrder(order);

        request.getSession().setAttribute("order", null);
        request.getRequestDispatcher("list").forward(request, response);
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
