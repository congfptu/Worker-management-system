/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Currency;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.CongNhan;
import model.Feature;
import model.Group;


/**
 *
 * @author congfptu
 */
public class LoginDAO extends DBContext {
    public CongNhan getCongNhanByAccount(String username){
        try {
            String sql = "select  d.id, d.name,d.address,d.gender,d.dob,d.MaxTimeChange,c.salary,d.username from SalaryHistory c \n" +
"inner join\n" +
"(\n" +
"select a.id, a.name,a.address,a.gender,a.dob,max(b.timeChange) as MaxTimeChange,e.username from CongNhan a \n" +
"inner join CongNhan_Account e on a.id=e.cid\n" +
"inner join SalaryHistory b on b.congnhanid=a.id\n" +
"where  b.timeChange<=GETDATE() and username=?\n" +
"group by a.id, a.name,a.address,a.gender,a.dob,e.username) d\n" +
"on c.timeChange=d.MaxTimeChange";
            PreparedStatement stm = connection.prepareStatement(sql);       
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
           CongNhan congnhan=null;
            while(rs.next())
            {
                if (congnhan==null){
                    congnhan= new CongNhan();
                    congnhan.setId(rs.getInt(1));
                    congnhan.setName(rs.getString(2));
                    congnhan.setAddress(rs.getString(3));
                    congnhan.setGender(rs.getBoolean(4));
                    congnhan.setDob(rs.getDate(5));
                     Locale vn = new Locale("en", "VN");
                      NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
                    congnhan.setCurrent_salary(rs.getDouble(7));
                    return congnhan ;
                }
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Account getByUsernameAndPassword(String username, String password)
    {
        try {
            String sql = "SELECT a.username,a.password,g.gid,g.name,f.id,f.url FROM\n" +
"Account a LEFT JOIN Group_Account ga ON a.username = ga.username\n" +
"                    			LEFT JOIN [Group] g ON ga.gid = g.gid\n" +
"                    			LEFT JOIN [Feature_Group] gf ON gf.gid = g.gid\n" +
"                    			LEFT JOIN Feature f ON f.id = gf.fid\n" +
"                    WHERE a.username =? AND a.password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            Account account = null;
            Group g = new Group();
            g.setId(-1);
            while(rs.next())
            {
                if(account == null)
                {
                    account = new Account();
                    account.setUsername(username);
                    account.setPassword(password);
                }
                int gid = rs.getInt("gid");
                if(gid!=-1)
                {
                    if(gid != g.getId())
                    {
                        g = new Group();
                        g.setId(gid);
                        g.setName(rs.getString("name"));
                        account.getGroups().add(g);
                    }
                    Feature f = new Feature();
                    f.setId(rs.getInt("id"));
                    f.setUrl(rs.getString("url"));
                    g.getFeatures().add(f);
                }
            }
            return account;
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public void update(Account s,String username) {
        try {
            String sql="update Account set password=? where username=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, s.getPassword());
            stm.setString(2, username);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
}public static void main(String[] args) {
double currencyAmount = 1500000.00;
Locale vn = new Locale("en", "VN");
Currency dollars = Currency.getInstance(vn);
NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
vnFormat.format(currencyAmount).substring(3);
    }
}
