/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Bi
 */
public class CDebt {
    private int cid;
    private int pid;
    private int quantity;
    private float unitprice;

    public float total(){
        return unitprice*quantity;
    }
    
    public CDebt(int cid, int pid, int quantity, float unitprice) {
        this.cid = cid;
        this.pid = pid;
        this.quantity = quantity;
        this.unitprice = unitprice;
    }

    public CDebt() {
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(float unitprice) {
        this.unitprice = unitprice;
    }
    
}
