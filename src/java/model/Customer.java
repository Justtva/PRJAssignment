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
public class Customer {
    private int id;
    private String name;
    private CDebt debt;
    private Date date;
    private float total;
    private String number;

    public Customer(int id, String name, CDebt debt, Date date, String number) {
        this.id = id;
        this.name = name;
        this.debt = debt;
        this.date = date;
        this.total = debt.total();
        this.number = number;
    }

    public Customer() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CDebt getDebt() {
        return debt;
    }

    public void setDebt(CDebt debt) {
        this.debt = debt;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
    
            
}
