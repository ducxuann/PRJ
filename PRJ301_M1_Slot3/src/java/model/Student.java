/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author xuanduc
 */
public class Student {
    String name;
    String level;
    String mode;
    Date date;

public Student() {
    }

    /**
     *
     * @param name
     * @param level
     * @param mode
     * @param date
     */
    public Student(String name, String level, String mode, Date date) {
        this.name = name;
        this.level = level;
        this.mode = mode;
        this.date = date;
    }

    public Student(String name, String level, String mode, java.util.Date date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    private static class Date {

        public Date() {
        }
    }
    
}
