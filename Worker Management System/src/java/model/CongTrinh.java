/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author congfptu
 */
public class CongTrinh {
    private int id;
    private String name;
    private String address;
    private Date begintime;
    private Date endtime;
    private ArrayList<CongNhan> congnhans=new ArrayList<>();
    private ArrayList<Integer> timekeeping =new ArrayList<>();
    private double tongcong;
    private double totalmoney;
    private String formatMoney;
    public CongTrinh() {
    }

    public CongTrinh(int id, String name, String address, Date begintime) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.begintime = begintime;
    }
    public ArrayList<Integer> getTimekeeping() {
        return timekeeping;
    }
    public void setTimekeeping(ArrayList<Integer> timekeeping) {
        this.timekeeping = timekeeping;
    }

    public double getTongcong() {
        return tongcong;
    }

    public void setTongcong(double tongcong) {
        this.tongcong = tongcong;
    }

    public String getFormatMoney() {
        return formatMoney;
    }

    public void setFormatMoney(String formatMoney) {
        this.formatMoney = formatMoney;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
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

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public ArrayList<CongNhan> getCongnhans() {
        return congnhans;
    }

    public void setCongnhans(ArrayList<CongNhan> congnhans) {
        this.congnhans = congnhans;
    }
    
    
}
