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
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Currency;
import java.util.Locale;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ChamCong;
import model.CongNhan;
import model.CongTrinh;
import model.TimeKeeping;

/**
 *
 * @author congfptu
 */
public class DiemDanhDAO extends DBContext {

//    public ArrayList<TimeKeeping> getAttends(int cid, int Year, int Month,int Days) {
//        //ArrayList<CongNhan> congnhans=new ArrayList<>();
//        ArrayList<TimeKeeping> timekeepings = new ArrayList<>();
//        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Europe/Paris"));
//        int curr_count = -1;
//        int curr_day=0;
//        try {
//            String sql = "select *from ChamCong where congtrinhid=? and YEAR(date)=? and Month(Date)=?\n" +
//"order by congnhanid,date,pid";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, cid);
//            stm.setInt(2, Year);
//            stm.setInt(3, Month);
//   
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                int id = rs.getInt(1);
//                int congnhanid = rs.getInt(2);
//                int congtrinhid = rs.getInt(3);
//                int pid = rs.getInt(4);
//                Date date = rs.getDate(5);
//                cal.setTime(date);
//                int day=cal.get(Calendar.DAY_OF_MONTH);
//                int aim_day=(day-1)*2+pid; 
//                boolean status = rs.getBoolean(6);
//               
//                if (curr_count == -1 || (curr_count >= 0 && timekeepings.get(curr_count).congnhanId != congnhanid)) {
//                     System.out.print("curr_count "+curr_count+" Days"+Days+" "+curr_day);              
//                    if (curr_count>=0)
//                    while ((Days-1)*2>curr_day){
//                       timekeepings.get(curr_count).timekeeping_report.add(false);
//                       curr_day++; 
//                    }
//                    timekeepings.add(new TimeKeeping());
//                    curr_count++;
//                    timekeepings.get(curr_count).congnhanId = congnhanid;
//                    curr_day=0;
//                }
//                while (curr_day<aim_day){
//                    timekeepings.get(curr_count).timekeeping_report.add(false);
//                    curr_day++;
//                }  
//                timekeepings.get(curr_count).timekeeping_report.add(status);
//            }
//            if (curr_count>=0)
//            while ((Days-1)*2>curr_day){
//                timekeepings.get(curr_count).timekeeping_report.add(false);
//                curr_day++; 
//             }
//            return timekeepings;
//        } catch (SQLException ex) {
//            Logger.getLogger(DiemDanhDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
    public ArrayList<Integer> getRecord(int days) {
        ArrayList<Integer> time = new ArrayList<>();
        for (int i = 0; i < days * 2; i++) {
            time.add(-1);
        }
        return time;
    }

//    public ArrayList<Boolean> saveAttend(Date date, int congtrinhid, int pid) {
//        ArrayList<Boolean> saves = new ArrayList<>();
//        try {
//            String sql = "select *from Chamcong where date=? and congtrinhid=? and pid=?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setDate(1, date);
//            stm.setInt(2, congtrinhid);
//            stm.setInt(3, pid);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                saves.add(rs.getBoolean("status"));
//            }
//            return saves;
//        } catch (SQLException ex) {
//            Logger.getLogger(DiemDanhDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }

    public ArrayList<CongNhan> getAttends(int Year, int Month, int cid, int Days) {
        ArrayList<CongNhan> congnhans = new ArrayList<>();

         Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
        int curr_count = -1;
        int curr_day = 0;
        double count_cong = 0;
        double total_money = 0;
        try {
            String sql = "select  bigrecord.congtrinhname,bigrecord.congnhanid,bigrecord.congtrinhid,bigrecord.name,bigrecord.pid,bigrecord.date,bigrecord.status,ISNULL(shh.salary,0) as salary from SalaryHistory shh\n" +
            "right join(\n" +
            "select e.name as congtrinhname,b.congnhanid,congtrinhid,a.name,c.pid,c.date,c.status,max(sh.timeChange) as MaxTimeChange from CongNhan a\n" +
            "inner join Congnhan_CongTrinh b on a.id=b.congnhanid\n" +
            "inner join ChamCong c on (c.congtrinhid=b.cid and c.congnhanid=b.congnhanid)\n" +
            "left join SalaryHistory sh on (a.id=sh.congnhanid and sh.timeChange<=c.date )\n" +
            "inner join CongTrinh e on (e.id=c.congtrinhid )\n" +
            "where YEAR(date)=? and Month(Date)=? and e.id=?\n" +
            "group by e.name ,a.id,b.congnhanid,c.congtrinhid,a.name,c.pid,c.date,c.status)\n" +
            "bigrecord\n" +
            "on shh.congnhanid=bigrecord.congnhanid\n" +
            "and shh.timeChange=bigrecord.MaxTimeChange\n" +
            "order by bigrecord.congnhanid,bigrecord.date,bigrecord.pid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Year);
            stm.setInt(2, Month);
            stm.setInt(3, cid);
            ResultSet rs = stm.executeQuery();
            CongNhan cur_cn = new CongNhan();
            cur_cn.setTimeKeeping(getRecord(Days));
            cur_cn.setId(-1);
            while (rs.next()) {
                //  int id = rs.getInt(1);
                int congnhanid = rs.getInt("congnhanid");
                int congtrinhid = rs.getInt("congtrinhid");
                String congnhanName = rs.getString("name");
                int pid = rs.getInt("pid");
                Date date = rs.getDate("date");
                double day_salary = rs.getDouble("salary");
                cal.setTime(date);
                int day = cal.get(Calendar.DAY_OF_MONTH);
                int aim_day = ((day - 1) * 2) + pid;
                System.out.println(aim_day);
                boolean status = rs.getBoolean("status");
                
                if (congnhanid != cur_cn.getId()) {
                    cur_cn = new CongNhan();
                    cur_cn.setId(congnhanid);
                    cur_cn.setName(congnhanName);
                    congnhans.add(cur_cn);
                    count_cong = 0;
                    total_money = 0;
                    cur_cn.setTimeKeeping(getRecord(Days));
                }
                if (status) {
                    cur_cn.getTimeKeeping().set(aim_day-1, 1);
                    count_cong++;
                    total_money += (day_salary / 2);
                    cur_cn.setTongcong(count_cong / 2);
                    cur_cn.setTotalmoney(total_money);
//                    double currencyAmount = total_money;
//                    Locale vn = new Locale("en", "VN");
//                    NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
//                    cur_cn.setFormatMoney(vnFormat.format(currencyAmount).substring(3)+" VNĐ");
                } else {
                    cur_cn.getTimeKeeping().set(aim_day-1, 0);
                }
            }
            return congnhans;
        } catch (SQLException ex) {
            Logger.getLogger(DiemDanhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
   
    public ArrayList<CongTrinh> reportAttends(int Year, int Month, int congnhanid, int Days) {
        ArrayList<CongTrinh> congtrinhs = new ArrayList<>();

        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
        int curr_count = -1;
        int curr_day = 0;
        double count_cong = 0;
         double total_money = 0;
        try {
            String sql = "select  bigrecord.congtrinhname,bigrecord.congnhanid,bigrecord.congtrinhid,bigrecord.name,bigrecord.pid,bigrecord.date,bigrecord.status,ISNULL(shh.salary,0) as salary from SalaryHistory shh\n" +
                "right join(\n" +
                "select e.name as congtrinhname,b.congnhanid,congtrinhid,a.name,c.pid,c.date,c.status,max(sh.timeChange) as MaxTimeChange from CongNhan a\n" +
                "inner join Congnhan_CongTrinh b on a.id=b.congnhanid\n" +
                "inner join ChamCong c on (c.congtrinhid=b.cid and c.congnhanid=b.congnhanid)\n" +
                "left join SalaryHistory sh on a.id=sh.congnhanid\n" +
                "inner join CongTrinh e on (e.id=c.congtrinhid and (sh.timeChange<=c.date))\n" +
                "where YEAR(date)=? and Month(Date)=? and b.congnhanid=?\n" +
                "group by e.name ,a.id,b.congnhanid,c.congtrinhid,a.name,c.pid,c.date,c.status\n" +
                ") bigrecord\n" +
                "on shh.congnhanid=bigrecord.congnhanid\n" +
                "and shh.timeChange=bigrecord.MaxTimeChange\n" +
                "order by bigrecord.congtrinhid,bigrecord.date,bigrecord.pid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Year);
            stm.setInt(2, Month);
            stm.setInt(3, congnhanid);
            ResultSet rs = stm.executeQuery();
            CongTrinh cur_ct = new CongTrinh();
            cur_ct.setTimekeeping(getRecord(Days));
            cur_ct.setId(-1);
            while (rs.next()) {
                //  int id = rs.getInt(1);
                int congtrinhid = rs.getInt("congtrinhid");
                String congtrinhname = rs.getString("congtrinhname");
                int pid = rs.getInt("pid");
                Date date = rs.getDate("date");
                double day_salary = rs.getDouble("salary");
                cal.setTime(date);
                int day = cal.get(Calendar.DAY_OF_MONTH);
                int aim_day = ((day - 1) * 2) + pid;
                boolean status = rs.getBoolean("status");
                if (congtrinhid != cur_ct.getId()) {
                    cur_ct = new CongTrinh();
                    cur_ct.setId(congtrinhid);
                    cur_ct.setName(congtrinhname);
                    congtrinhs.add(cur_ct);
                    count_cong = 0;
                    total_money = 0;
                    cur_ct.setTimekeeping(getRecord(Days));
                }           
                if (status) {
                    cur_ct.getTimekeeping().set(aim_day-1, 1);
                    count_cong++;
                     total_money += (day_salary / 2);
                    cur_ct.setTongcong(count_cong / 2);
                     cur_ct.setTotalmoney(total_money);
                      double currencyAmount = total_money;
                    Locale vn = new Locale("en", "VN");
                   
                    NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
                    cur_ct.setFormatMoney(vnFormat.format(currencyAmount).substring(3)+" VNĐ");
                } else {
                    cur_ct.getTimekeeping().set(aim_day-1, 0);
                }
            }
            return congtrinhs;
        } catch (SQLException ex) {
            Logger.getLogger(DiemDanhDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        DiemDanhDAO dd = new DiemDanhDAO();   
         
             System.out.println(dd.getAttends(2021, 3, 1, 31).get(0).getTotalmoney());
    }
}
