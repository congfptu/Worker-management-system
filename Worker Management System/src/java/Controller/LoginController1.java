
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
import model.Account;

/**
 *
 * @author congfptu
 */
public class LoginController1 extends HttpServlet {

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
        add("username", "", 0, response);
        String username = getCookies("username", request);
        if (username != null && !username.equals("")) {
            Account account = new Account();
            account.setUsername(username);
            request.getSession().setAttribute("account", account);
           request.getRequestDispatcher("home").forward(request, response);
        }
        request.setAttribute("account", request.getSession().getAttribute("account"));
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public Cookie add(String name, String value, int hours, HttpServletResponse response) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(60 * 60 * hours);
        response.addCookie(cookie);
        return cookie;
    }

    public String getCookies(String name, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("username")) {
                    return cooky.getValue();
                }
            }
        }
        return "";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LoginDAO db = new LoginDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = db.getByUsernameAndPassword(username, password);
        if (account != null) {
            request.getSession().setAttribute("account", account);
            if (request.getParameter("remember") != null) {
                account.setRemember(true);
            } else {
                account.setRemember(false);
            }
            if (account.isRemember()) {
                add("username", account.getUsername(), 10, response);
            } else {
                add("username", account.getUsername(), -1, response);
            }
            response.sendRedirect("home");
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
