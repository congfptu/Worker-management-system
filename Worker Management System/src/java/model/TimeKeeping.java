/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author congfptu
 */
public class TimeKeeping {
    public int congnhanId;
    public ArrayList<Boolean> timekeeping_report;

    public TimeKeeping() {
        timekeeping_report=new ArrayList<>();
    }

    public int getCongnhanId() {
        return congnhanId;
    }

    public void setCongnhanId(int congnhanId) {
        this.congnhanId = congnhanId;
    }

    public ArrayList<Boolean> getTimekeeping_report() {
        return timekeeping_report;
    }

    public void setTimekeeping_report(ArrayList<Boolean> timekeeping_report) {
        this.timekeeping_report = timekeeping_report;
    }
    
    
}
