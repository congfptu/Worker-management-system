/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;
import java.util.logging.Logger;

/**
 *
 * @author congfptu
 */
public class CongNhan {

    private int id;
    private String name;
    private String address;
    private Date dob;
    private ArrayList<Integer> timeKeeping = new ArrayList<>();
    private boolean gender;
    private double tongcong;
    private double totalmoney;
    private String formatMoney;
    private String formatSalary;
    private boolean status;
    private double current_salary;
    private String formatDob;
    private String timechange;
    private String genderString;
    public CongNhan() {

    }

    public double getTongcong() {
        return tongcong;
    }

    public void setTongcong(double tongcong) {
        this.tongcong = tongcong;
    }

    public String getGenderString() {
       if (gender) return "Nam"; else return "Nữ";
    }

    public void setGenderString(String genderString) {
        this.genderString = genderString;
    }

    public String getFormatMoney() {
        double currencyAmount = totalmoney;
        Locale vn = new Locale("en", "VN");
        NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
        return vnFormat.format(currencyAmount).substring(3) + " VNĐ";
    }

    public void setFormatMoney(String formatMoney) {
        this.formatMoney = formatMoney;
    }
    public String getFormatSalary() {
        double currencyAmount = current_salary;
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

    public String getFormatDob() {
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        return (format.format(dob));
    }

    public void setFormatDob(String formatDob) {
        this.formatDob = formatDob;
    }

    public double getCurrent_salary() {
        return current_salary;
    }

    public void setCurrent_salary(double current_salary) {
        this.current_salary = current_salary;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }
    private static final Logger LOG = Logger.getLogger(CongNhan.class.getName());

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public ArrayList<Integer> getTimeKeeping() {
        return timeKeeping;
    }

    public void setTimeKeeping(ArrayList<Integer> TimeKeeping) {
        this.timeKeeping = TimeKeeping;
    }

    @Override
    public String toString() {
        return "CongNhan{" + "id=" + id + ", name=" + name + ", address=" + address + ", dob=" + dob + ", timeKeeping=" + timeKeeping + ", gender=" + gender + ", tongcong=" + tongcong + ", totalmoney=" + totalmoney + ", status=" + status + '}';
    }

}
