/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import function.getDate;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.geometry.Side;
import model.ChamCong;
import model.CongNhan;
import model.ReportSalaryHistory;

/**
 *
 * @author congfptu
 */
public class SalaryDAO extends DBContext {

    public ArrayList<CongNhan> getAllCongNhans() {

        ArrayList<CongNhan> cns = new ArrayList<>();
        try {
            String sql = "Select * from CongNhan";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CongNhan cn = new CongNhan();
                cn.setId(rs.getInt(1));
                cn.setName(rs.getString(2));
                cn.setAddress(rs.getString(3));
                cn.setGender(rs.getBoolean(4));
                cns.add(cn);
            }
            return cns;
        } catch (SQLException ex) {
            Logger.getLogger(SalaryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<CongNhan> getSalaryAll() {

        ArrayList<CongNhan> cns = new ArrayList<>();
        try {
            String sql = "select  d.id, d.name,d.address,d.gender,d.dob,d.MaxTimeChange,c.salary from SalaryHistory c \n" +
                    "inner join\n" +
                    "(\n" +
                    "select a.id, a.name,a.address,a.gender,a.dob,max(b.timeChange) as MaxTimeChange from CongNhan a \n" +
                    "inner join SalaryHistory b on b.congnhanid=a.id\n" +
                    "where  b.timeChange<=GETDATE()\n" +
                    "group by a.id, a.name,a.address,a.gender,a.dob) d\n" +
                    "on c.timeChange=d.MaxTimeChange and c.congnhanid=d.id\n" +
                    "order by d.id ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CongNhan cn = new CongNhan();
                cn.setId(rs.getInt(1));
                cn.setName(rs.getString(2));
                cn.setAddress(rs.getString(3));
                cn.setGender(rs.getBoolean(4));
                cn.setDob(rs.getDate(5));
                cn.setCurrent_salary(rs.getDouble(7));
                cns.add(cn);
            }
            return cns;
        } catch (SQLException ex) {
            Logger.getLogger(SalaryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<ReportSalaryHistory> getSalaryHistoryByID(int id) {

        ArrayList<ReportSalaryHistory> rps = new ArrayList<>();
        try {
            String sql = "select  salary,timechange from CongNhan a\n"
                    + "inner join SalaryHistory b\n"
                    + "on a.id=b.congnhanid \n"
                    + "where a.id=? order by timechange desc" ;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ReportSalaryHistory rp = new ReportSalaryHistory();
                rp.setSalary(rs.getDouble("salary"));
                rp.setTimechange(rs.getString("timechange"));
                rps.add(rp);
            }
            return rps;
        } catch (SQLException ex) {
            Logger.getLogger(SalaryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertSalaryUpdate(int congnhanid, double salary, String timechange) {
        try {
            String sql = "insert into SalaryHisTory(congnhanid,salary,timeChange) values(?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, congnhanid);
            stm.setDouble(2, salary);
            stm.setString(3, timechange);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SalaryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public void deleteSalary(int congnhanid, String timechange) {
        try {
            String sql = "delete from SalaryHistory where congnhanid=? and timechange=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, congnhanid);
            stm.setString(2, timechange);  
             stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SalaryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  
}
