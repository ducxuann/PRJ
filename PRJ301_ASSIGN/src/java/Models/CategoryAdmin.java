/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Tran Hieu
 */
public class CategoryAdmin {
    private String cname;
    private int cateID;

    public CategoryAdmin() {
    }

    public CategoryAdmin(String cname, int cateID) {
        this.cname = cname;
        this.cateID = cateID;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }
    
    
    
}
