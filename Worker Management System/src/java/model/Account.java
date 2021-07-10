/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sap-lap
 */
public class Account {
    private String username;
    private String password;
    private boolean remember;
     private ArrayList<Group> groups = new ArrayList<>();

    public Account() {
    }

    public ArrayList<Group> getGroups() {
        return groups;
    }

    public void setGroups(ArrayList<Group> groups) {
        this.groups = groups;
    }

    public Account(String username, String password, boolean remember) {
        this.username = username;
        this.password = password;
        this.remember = remember;
    }
    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }
   

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

  
    
}
