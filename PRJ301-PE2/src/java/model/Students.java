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
public class Students {
    String studentID;
    String studentName;
    Date birthDate;
    String className;
    Date startDate;
    String inName;
    boolean gender;

    public Students() {
    }

    public Students(String studentID, String studentName, Date birthDate, String className, Date startDate) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.birthDate = birthDate;
        this.className = className;
        this.startDate = startDate;
    }

    public Students(String studentID, String studentName, Date birthDate, String className, Date startDate, String inName) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.birthDate = birthDate;
        this.className = className;
        this.startDate = startDate;
        this.inName = inName;
    }

    public Students(String studentID, String studentName, Date birthDate, String className, Date startDate, String inName, boolean gender) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.birthDate = birthDate;
        this.className = className;
        this.startDate = startDate;
        this.inName = inName;
        this.gender = gender;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
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

    public String getInName() {
        return inName;
    }

    public void setInName(String inName) {
        this.inName = inName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "Students{" + "studentID=" + studentID + ", studentName=" + studentName + ", birthDate=" + birthDate + ", className=" + className + ", startDate=" + startDate + ", inName=" + inName + ", gender=" + gender + '}';
    }

}
