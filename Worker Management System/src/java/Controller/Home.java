/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import function.getDate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author congfptu
 */
public class Home extends BaseController {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_year = request.getParameter("year");
        String raw_month = request.getParameter("month");
        String cid = request.getParameter("ct");
        getDate gd = new getDate();
        if (raw_year == null || raw_year == null) {
            int year = Calendar.getInstance().get(Calendar.YEAR);
            int month = Calendar.getInstance().get(Calendar.MONTH);
            ArrayList<Integer> listDay = gd.getDays(year, month);
            request.setAttribute("listDay", listDay);
        } else {
            String ryear = raw_year.substring(1);
            int year = Integer.parseInt(ryear);
            int month = Integer.parseInt(raw_month);
            ArrayList<Integer> listDay = gd.getDays(year, month);
            request.setAttribute("listDay", listDay);
            request.setAttribute("Year", year);
            request.setAttribute("Month", month);
        }
        ArrayList<Integer> listMonth = gd.getMonths();
        ArrayList<Integer> listYear = gd.getYears();
        ArrayList<Account> accounts = gd.getAccounts();

        request.setAttribute("listMonth", listMonth);
        request.setAttribute("listYear", listYear);
        request.setAttribute("accounts", accounts);
        request.setAttribute("account", request.getSession().getAttribute("account"));
        request.getRequestDispatcher("view/Home.jsp").forward(request, response);

    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       processRequest(request, response);

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
