/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author Tran Hieu
 */
public class Order {
    private int id;
    private Date date;
    private int cid;
    private String totalmoney;
    private String fullnameorder;
    private String addressorder;
    private String phoneorder;

    public Order() {
    }

    public Order(int id, Date date, int cid, String totalmoney, String fullnameorder, String addressorder, String phoneorder) {
        this.id = id;
        this.date = date;
        this.cid = cid;
        this.totalmoney = totalmoney;
        this.fullnameorder = fullnameorder;
        this.addressorder = addressorder;
        this.phoneorder = phoneorder;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(String totalmoney) {
        this.totalmoney = totalmoney;
    }

    public String getFullnameorder() {
        return fullnameorder;
    }

    public void setFullnameorder(String fullnameorder) {
        this.fullnameorder = fullnameorder;
    }

    public String getAddressorder() {
        return addressorder;
    }

    public void setAddressorder(String addressorder) {
        this.addressorder = addressorder;
    }

    public String getPhoneorder() {
        return phoneorder;
    }

    public void setPhoneorder(String phoneorder) {
        this.phoneorder = phoneorder;
    }

   
    
    
}
