/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Application;
import model.CongNhan;

/**
 *
 * @author congfptu
 */
public class ApplicationDAO extends DBContext {

    public void insertApplication(Application a) {
        try {
            String sql = "insert into Application(congnhanid,content,[timeSubmit],[status]) values(?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, a.getCongnhan().getId());
            stm.setString(2, a.getContent());
            stm.setString(3, a.getDateSubmit());
            stm.setInt(4, a.getStatus());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CongTrinhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Application> getAllApplications(int status) {
        ArrayList<Application> apps = new ArrayList<>();
        try {
            String sql = "select a.id as aid,b.id,b.name,b.address,b.gender,a.content,a.timeSubmit,a.[status] from [application] a \n"
                    + "inner join CongNhan b on a.congnhanid=b.id\n"
                    + "where a.[status]=?\n"
                    + "group by a.id,b.id,b.name,b.address,b.gender,a.content,a.timeSubmit,a.[status]\n"
                    + "order by a.timeSubmit desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CongNhan cn = new CongNhan();
                Application a = new Application();
                a.setId(rs.getInt("aid"));
                cn.setId(rs.getInt("id"));
                cn.setName(rs.getString("name"));
                a.setCongnhan(cn);
                a.setContent(rs.getString("content"));
                a.setDateSubmit(rs.getString("timeSubmit").substring(0, 19));
                a.setStatus(rs.getInt("status"));
                apps.add(a);
            }
            return apps;
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public ArrayList<Application> getApplicationProcessed(int pageindex, int pagesize) {
        ArrayList<Application> apps = new ArrayList<>();
        try {
            String sql = "select*from(\n" +
                        "select ROW_NUMBER() OVER(order by a.timeSubmit desc) as rid,a.id as aid,b.id,b.name,b.address,b.gender,a.content,a.timeSubmit,a.timeApproved,a.[status],a.note from [application] a \n" +
                        "inner join CongNhan b on a.congnhanid=b.id\n" +
                        "where a.status=0 or a.status=1\n" +
                        "group by a.id,b.id,b.name,b.address,b.gender,a.content,a.timeSubmit,a.timeApproved,a.[status],a.note\n" +
                        ") app\n" +
                        "where app.rid>=(?-1)*?+1 and rid<=?*?\n" +
                        "order by app.timeSubmit desc";
            PreparedStatement stm = connection.prepareStatement(sql);  
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
               CongNhan cn = new CongNhan();
                Application a = new Application();
                a.setId(rs.getInt("aid"));
                cn.setId(rs.getInt("id"));
                cn.setName(rs.getString("name"));
                a.setCongnhan(cn);
                a.setContent(rs.getString("content"));
                a.setDateSubmit(rs.getString("timeSubmit").substring(0, 19));
                if (rs.getString("timeApproved") == null) {
                    a.setDateApproved(rs.getString("timeApproved"));
                } else {
                    a.setDateApproved(rs.getString("timeApproved").substring(0, 19));
                }
                a.setNote(rs.getString("note"));
                a.setStatus(rs.getInt("status"));
                apps.add(a);
            }
            return apps;
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Application> getAllApplicationsByUser(int congnhanid, int pageindex, int pagesize) {
        ArrayList<Application> apps = new ArrayList<>();
        try {
            String sql = "select*from(\n"
                    + "select ROW_NUMBER() OVER(order by a.timeSubmit desc) as rid,a.id as aid,b.id,b.name,b.address,b.gender,a.content,a.timeSubmit,a.timeApproved,a.[status],a.note from [application] a \n"
                    + "inner join CongNhan b on a.congnhanid=b.id\n"
                    + "where b.id=?\n"
                    + "group by a.id,b.id,b.name,b.address,b.gender,a.content,a.timeSubmit,a.timeApproved,a.[status],a.note\n"
                    + ") app\n"
                    + "where app.rid>=(?-1)*?+1 and rid<=?*?\n"
                    + "order by app.timeSubmit desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, congnhanid);
            stm.setInt(2, pageindex);
            stm.setInt(3, pagesize);
            stm.setInt(4, pageindex);
            stm.setInt(5, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CongNhan cn = new CongNhan();
                Application a = new Application();
                a.setId(rs.getInt("aid"));
                cn.setId(rs.getInt("id"));
                cn.setName(rs.getString("name"));
                a.setCongnhan(cn);
                a.setContent(rs.getString("content"));
                a.setDateSubmit(rs.getString("timeSubmit").substring(0, 19));
                if (rs.getString("timeApproved") == null) {
                    a.setDateApproved(rs.getString("timeApproved"));
                } else {
                    a.setDateApproved(rs.getString("timeApproved").substring(0, 19));
                }
                a.setNote(rs.getString("note"));
                a.setStatus(rs.getInt("status"));
                apps.add(a);
            }
            return apps;
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateApplication(int status, String timeApproved, String note, int id) {
        try {
            String sql = "update application set status=?,timeApproved=?,note=? where id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setString(2, timeApproved);
            stm.setString(3, note);
            stm.setInt(4, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int count(int congnhanid) {
        String sql = "select count(*) as total from application a\n"
                + "where a.congnhanid=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, congnhanid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
     public int countApplication() {
        String sql = "select count(*) as total from application a\n" +
                        "where status=0 or status=1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
}
