/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 *
 * @author congfptu
 */
public class ReportSalaryHistory {
    CongNhan cn;
    String timechange;
    double salary;
    String formatTime;
    String formatSalary;
   
    public ReportSalaryHistory() {
    }

    public CongNhan getCn() {
        return cn;
    }

    public void setCn(CongNhan cn) {
        this.cn = cn;
    }

    public String getFormatSalary() {
         double currencyAmount = salary;
        Locale vn = new Locale("en", "VN");

        NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
        return vnFormat.format(currencyAmount).substring(3) + " VNĐ";
    }

    public void setFormatSalary(String formatSalary) {
        this.formatSalary = formatSalary;
    }

    public String getTimechange() {
        return timechange;
    }

    public void setTimechange(String timechange) {
        this.timechange = timechange;
    }

    public String getFormatTime() {
       Date b=Date.valueOf(timechange);
       SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        return (format.format(b));
    }

    public void setFormatTime(String formatTime) {
        this.formatTime = formatTime;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
    
}
