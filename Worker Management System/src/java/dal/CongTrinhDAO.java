/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ChamCong;
import model.CongNhan;
import model.CongTrinh;

/**
 *
 * @author congfptu
 */
public class CongTrinhDAO extends DBContext {

    public ArrayList<CongTrinh> getCongTrinhs() {

        ArrayList<CongTrinh> cts = new ArrayList<>();
        try {
            String sql = "select a.id,a.name as congtrinh,a.address,a.begintime,ISNULL(b.congnhanid,-1)as congnhanid,c.[name] as congnhan,c.[address] as cnaddress ,c.gender from CongTrinh a \n"
                    + "left join Congnhan_CongTrinh b on a.id=b.cid \n"
                    + "left join CongNhan c on b.congnhanid=c.id where statuscongtrinh=0";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            int cid = -1;
            CongTrinh ct = new CongTrinh();
            ct.setId(-1);
            while (rs.next()) {
                int ctid = rs.getInt("id");
                if (ctid != ct.getId()) {
                    ct = new CongTrinh();
                    ct.setId(ctid);
                    String ctname = rs.getString("congtrinh");
                    String ctaddress = rs.getString("address");
                    Date ctbegintime = rs.getDate("begintime");
                    ct.setName(ctname);
                    ct.setAddress(ctaddress);
                    ct.setBegintime(ctbegintime);
                    cts.add(ct);
                }
                if (rs.getInt("congnhanid") != cid) {

                    CongNhan cn = new CongNhan();
                    int cnid = rs.getInt("congnhanid");
                    String congnhan = rs.getString("congnhan");
                    String cnaddress = rs.getString("cnaddress");
                    boolean gender = rs.getBoolean("gender");
                    cn.setId(cnid);
                    cn.setName(congnhan);
                    cn.setAddress(cnaddress);
                    cn.setGender(gender);
                    ct.getCongnhans().add(cn);
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(CongTrinhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cts;
    }

    public ArrayList<CongNhan> getCongNhanByCongTrinh(int cid) {
        ArrayList<CongNhan> congnhans = new ArrayList<>();
        try {
            String sql = "select a.* from CongNhan a \n"
                    + "inner join Congnhan_CongTrinh b on a.id=b.congnhanid\n"
                    + "inner join CongTrinh c on b.cid=c.id\n"
                    + "where c.id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CongNhan cn = new CongNhan();
                cn.setId(rs.getInt("id"));
                cn.setName(rs.getString("name"));
                cn.setAddress(rs.getString("address"));
                cn.setGender(rs.getBoolean("gender"));
                cn.setDob(rs.getDate("dob"));
                congnhans.add(cn);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CongTrinhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return congnhans;
    }

    public ArrayList<CongNhan> getAttendData(Date date, int congtrinhid, int pid) {
        ArrayList<CongNhan> congnhans = new ArrayList<>();
        try {
            String sql = "select a.id,a.name,a.address,a.gender,a.dob,d.congtrinhid,pid,[status],d.date from CongNhan a \n"
                    + "inner join Congnhan_CongTrinh b on a.id=b.congnhanid\n"
                    + "inner join CongTrinh c on b.cid=c.id\n"
                    + "inner join ChamCong d on (d.congnhanid=a.id and d.congtrinhid=c.id)\n"
                    + "where date=? and c.id=? and pid=?\n"
                    + "group by a.id,a.name,a.address,a.gender,a.dob,d.congtrinhid,pid,[status],d.date";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            stm.setInt(2, congtrinhid);
            stm.setInt(3, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CongNhan cn = new CongNhan();
                cn.setId(rs.getInt("id"));
                cn.setName(rs.getString("name"));
                cn.setAddress(rs.getString("address"));
                cn.setGender(rs.getBoolean("gender"));
                cn.setDob(rs.getDate("dob"));
               cn.setStatus(rs.getBoolean("status"));
                congnhans.add(cn);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CongTrinhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return congnhans;
    }

    public void insertDiemDanh(ChamCong cc) {
        try {
            String sql = "insert into ChamCong(congnhanid,congtrinhid,pid,[date],[status]) values(?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cc.getCongnhanid());
            stm.setInt(2, cc.getCongtrinhid());
            stm.setInt(3, cc.getSessionid());
            stm.setDate(4, cc.getDate());
            stm.setBoolean(5, cc.isStatus());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CongTrinhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateDiemDanh(ChamCong cc) {
        try {
            String sql = "update ChamCong set [status]=? where [date]=? and congnhanid=? and congtrinhid=? and pid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, cc.isStatus());
            stm.setDate(2, cc.getDate());
            stm.setInt(3, cc.getCongnhanid());
            stm.setInt(4, cc.getCongtrinhid());
            stm.setInt(5, cc.getSessionid());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CongTrinhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAttend(Date date, int congtrinhid, int sessionid) {
        try {
            String sql = "delete from ChamCong Where date=? and congtrinhid=? and pid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            stm.setInt(2, congtrinhid);
            stm.setInt(3, sessionid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CongTrinhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<CongTrinh> getCongTrinhsByCongNhan(int congnhanid) {

        ArrayList<CongTrinh> cts = new ArrayList<>();
        try {
            String sql = "select * from CongTrinh a \n"
                    + "inner join Congnhan_CongTrinh b on a.id=b.cid\n"
                    + "where congnhanid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, congnhanid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CongTrinh ct = new CongTrinh();
                ct.setId(rs.getInt("id"));
                ct.setName(rs.getString("name"));
                ct.setAddress(rs.getString("address"));
                ct.setBegintime(rs.getDate("begintime"));
                cts.add(ct);
            }
            return cts;
        } catch (SQLException ex) {
            Logger.getLogger(CongTrinhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        CongTrinhDAO db = new CongTrinhDAO();
//        ArrayList<CongTrinh> cts = db.getCongTrinhs();
//        for (CongTrinh ct : cts) {
//
//            System.out.println(ct);
//
//        }
        ArrayList<CongNhan> cns=db.getAttendData(Date.valueOf("2021-03-12"), 1, 2);
        for (CongNhan cn : cns) {
            System.out.println(cn);
        }
    }
}
