/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.CongTrinhDAO;
import dal.DiemDanhDAO;
import function.getDate;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Currency;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.CongNhan;
import model.CongTrinh;
import model.TimeKeeping;

/**
 *
 * @author congfptu
 */
@WebServlet(name = "thongkeController", urlPatterns = {"/thongke"})
public class thongkeController extends BaseController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        CongTrinhDAO db = new CongTrinhDAO();
        DiemDanhDAO dd = new DiemDanhDAO();
        getDate gd = new getDate();

        int year = 0;
        int month = 0;
        ArrayList<CongTrinh> cts = db.getCongTrinhs();
        String raw_congtrinhid = request.getParameter("congtrinh");
        int congtrinhid = 1;
        if (raw_congtrinhid != null) {
            congtrinhid = Integer.parseInt(raw_congtrinhid);
        }
        String raw_year = request.getParameter("year");
        String raw_month = request.getParameter("month");
        String cid = request.getParameter("ct");
        if (raw_year == null || raw_year == null) {
            year = Calendar.getInstance().get(Calendar.YEAR);
            month = Calendar.getInstance().get(Calendar.MONTH) + 1;
        } else {

            year = Integer.parseInt(raw_year);
            month = Integer.parseInt(raw_month);
        }

        ArrayList<Integer> listDay = gd.getDays(year, month);
        //      ArrayList<TimeKeeping> timeKeepings =dd.getAttends(congtrinhid,year, month,listDay.size());
        //  request.setAttribute("timekeepings", timeKeepings);
        ArrayList<CongNhan> congnhans = dd.getAttends(year, month, congtrinhid, listDay.size());
        double countAttends = 0;
        double total = 0;
        for (CongNhan congnhan : congnhans) {
            for (Integer integer : congnhan.getTimeKeeping()) {
                if (integer == 1) {
                    countAttends += 0.5;
                }
            }
               total += congnhan.getTotalmoney();
                
        } 
            Locale vn = new Locale("en", "VN");
            Currency vnmoney = Currency.getInstance(vn);
            NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
            request.setAttribute("total", vnFormat.format(total).substring(3) + " VNĐ");
            request.setAttribute("count", countAttends);
            request.setAttribute("congnhans", congnhans);
            if (congnhans != null) {
                request.setAttribute("size", congnhans.size());
            }
            request.setAttribute("totalday", listDay.size()+1);
            request.setAttribute("listDay", listDay);
            request.setAttribute("Year", year);
            request.setAttribute("Month", month);
            ArrayList<Integer> listMonth = gd.getMonths();
            ArrayList<Integer> listYear = gd.getYears();
            ArrayList<Account> accounts = gd.getAccounts();
            request.setAttribute("listMonth", listMonth);
            request.setAttribute("listYear", listYear);
            request.setAttribute("cns", db.getCongNhanByCongTrinh(congtrinhid));
            request.setAttribute("congtrinhid", congtrinhid);
            request.setAttribute("cts", cts);
            request.getRequestDispatcher("/view/thongke.jsp").forward(request, response);
        }

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
