/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author congfptu
 */
public class ChamCong {
    private int congnhanid;
    private int congtrinhid;
    private Date date;
    private int sessionid;
    private boolean status;

    public ChamCong() {
    }

    public int getCongnhanid() {
        return congnhanid;
    }

    public void setCongnhanid(int congnhanid) {
        this.congnhanid = congnhanid;
    }

    public int getCongtrinhid() {
        return congtrinhid;
    }

    public void setCongtrinhid(int congtrinhid) {
        this.congtrinhid = congtrinhid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getSessionid() {
        return sessionid;
    }

    public void setSessionid(int sessionid) {
        this.sessionid = sessionid;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
    
}
