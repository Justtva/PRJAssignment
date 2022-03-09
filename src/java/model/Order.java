/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Bi
 */
public class Order {
    private Date date;
    private ArrayList<OrderDetail> details = new ArrayList();

    public int getSize(){
        int size=0;
        for (OrderDetail detail : details) {
            size +=detail.getQuantity();
        }
        return size;
    }
    
    public float getTotal(){
        float sum = 0;
        for (OrderDetail detail : details) {
            sum += detail.getTotal();
        }
        return sum;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public ArrayList<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<OrderDetail> details) {
        this.details = details;
    }
}
