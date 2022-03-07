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
public class Product {
    private int id;
    private String name;
    private float import_price;
    private float sell_price;
    private int quantity;

    public Product(int id, String name, float import_price, float sell_price, int quantity) {
        this.id = id;
        this.name = name;
        this.import_price = import_price;
        this.sell_price = sell_price;
        this.quantity = quantity;
    }

    public Product() {
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

    public float getImport_price() {
        return import_price;
    }

    public void setImport_price(float import_price) {
        this.import_price = import_price;
    }

    public float getSell_price() {
        return sell_price;
    }

    public void setSell_price(float sell_price) {
        this.sell_price = sell_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
