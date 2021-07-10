/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;

import dal.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author congfptu
 */
public class getDate extends DBContext {

    public ArrayList<Integer> getDays(int year, int month) {
        ArrayList<Integer> listDay = new ArrayList();
        int days = YearMonth.of(year, month).lengthOfMonth();
        for (int i = 1; i <= days; i++) {
            listDay.add(i);
        }
        return listDay;
    }

    public ArrayList<Integer> getYears() {
        ArrayList<Integer> listYear = new ArrayList();
        int year = Calendar.getInstance().get(Calendar.YEAR);
        for (int i = year - 5; i <= year + 5; i++) {
            listYear.add(i);
        }
        return listYear;
    }

    public ArrayList<Integer> getMonths() {
        ArrayList<Integer> listMonth = new ArrayList();
        for (int i = 1; i <= 12; i++) {
            listMonth.add(i);
        }
        return listMonth;
    }

    public ArrayList<Account> getAccounts() {

        ArrayList<Account> logs = new ArrayList<>();
        try {
            String sql = "Select [username],[password] from Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account s = new Account();

                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                logs.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(getDate.class.getName()).log(Level.SEVERE, null, ex);
        }
        return logs;
    }

    public ArrayList<LocalDate> getDates() {
        ArrayList<LocalDate> dates = new ArrayList<>();
        for (int i = 0; i < 30; i++) {
            dates.add(java.time.LocalDate.now().minusDays(i));
        }
        return dates;
    }

    public static void main(String[] args) {
        getDate gd = new getDate();
        for (LocalDate date : gd.getDates()) {
            System.out.println(date);
        }
    }

}
