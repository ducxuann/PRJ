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
public class Instructors {
    String inID;
    String inName;
    Date inbirthDate;
    boolean ingender;
    int classID;

    public Instructors() {
    }

    public Instructors(String inID, String inName, Date birthDate, boolean gender, int classID) {
        this.inID = inID;
        this.inName = inName;
        this.inbirthDate = birthDate;
        this.ingender = gender;
        this.classID = classID;
    }

    public String getInID() {
        return inID;
    }

    public void setInID(String inID) {
        this.inID = inID;
    }

    public String getInName() {
        return inName;
    }

    public void setInName(String inName) {
        this.inName = inName;
    }

    public Date getBirthDate() {
        return inbirthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.inbirthDate = birthDate;
    }

    public boolean isGender() {
        return ingender;
    }

    public void setGender(boolean gender) {
        this.ingender = gender;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    @Override
    public String toString() {
        return "Instructors{" + "inID=" + inID + ", inName=" + inName + ", birthDate=" + inbirthDate + ", gender=" + ingender + ", classID=" + classID + '}';
    }
    
}
