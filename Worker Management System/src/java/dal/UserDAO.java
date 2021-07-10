/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author congfptu
 */
public class UserDAO  extends DBContext{
     public void update(String name,String address,String dob,String gender,int id) {
        try {
            String sql="update CongNhan set name=?,[address]=? ,dob=?,gender=? where id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, address);
            stm.setString(3, dob);
            stm.setString(4, gender);
            stm.setInt(5,id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
     public static void main(String[] args) {
       UserDAO us=new UserDAO();
       us.update("nguyễn văn mặn", "bắc nam", "2020-06-20", "1", 1);
    }
}
