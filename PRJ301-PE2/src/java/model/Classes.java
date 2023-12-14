/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Classes {
    int classID;
    String className;
    Date startDate;

    public Classes() {
    }

    public Classes(int classID, String className, Date startDate) {
        this.classID = classID;
        this.className = className;
        this.startDate = startDate;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Override
    public String toString() {
        return "Classes{" + "classID=" + classID + ", className=" + className + ", startDate=" + startDate + '}';
    }
    
}
