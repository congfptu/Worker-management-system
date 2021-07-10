
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.CongNhan;

/**
 *
 * @author congfptu
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
        Cookie cookie = null;
        Cookie[] cookies = null;
        String username = "";
        String password = "";
        // Get an array of Cookies associated with this domain
        cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
                if (cookie.getName().equals("password")) {
                    password = cookie.getValue();
                }
            }
        }
        LoginDAO db = new LoginDAO();
        Account a = db.getByUsernameAndPassword(username, password);
        CongNhan congnhan=db.getCongNhanByAccount(username);
        if (a != null ) {
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            
            if (congnhan==null)
            response.sendRedirect("home");
            else{
                session.setAttribute("congnhan", congnhan);      
                session.setAttribute("id", congnhan.getId());
              response.sendRedirect("user");
            }
        } else {
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        LoginDAO db = new LoginDAO();
        Account a = db.getByUsernameAndPassword(username, password);
        CongNhan congnhan=db.getCongNhanByAccount(username);
     
        if (a != null) {
            if (remember != null) {
                if (remember != null) {
                    Cookie c_user = new Cookie("username", username);
                    Cookie c_pass = new Cookie("password", password);
                    c_user.setMaxAge(3600 * 24 * 15);
                    c_pass.setMaxAge(3600 * 24 * 15);
                    response.addCookie(c_user);
                    response.addCookie(c_pass);
                }
            }
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
             session.setAttribute("congnhan", congnhan);
             if (congnhan==null)          
            response.sendRedirect("home"); 
            else
                response.sendRedirect("user");
            
           
            
        } else {
            request.setAttribute("mess", "invalid username or password");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
