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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.CongNhan;
import model.CongTrinh;

/**
 *
 * @author congfptu
 */
public class AttendReportController extends BaseController {

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
        CongTrinhDAO db = new CongTrinhDAO();
        getDate gd = new getDate();
        int year = 0;
        int month = 0;
         double countAttends=0;
        double total=0;
        CongNhan cn = (CongNhan) request.getSession().getAttribute("congnhan");
        ArrayList<CongTrinh> cts = db.getCongTrinhsByCongNhan(cn.getId());
       
      
        String raw_year = request.getParameter("year");
        String raw_month = request.getParameter("month");
        String cid = request.getParameter("ct");
        if (raw_year == null || raw_year == null) {
            year = Calendar.getInstance().get(Calendar.YEAR);
            month = Calendar.getInstance().get(Calendar.MONTH)+1;
        } else {         
            year = Integer.parseInt(raw_year);
            month = Integer.parseInt(raw_month);
        }
        ArrayList<Integer> listDay = gd.getDays(year, month );
        request.setAttribute("listDay", listDay);
        request.setAttribute("Year", year);
        request.setAttribute("Month", month );
        DiemDanhDAO dd = new DiemDanhDAO();
        ArrayList<CongTrinh> congtrinhs = dd.reportAttends(year, month, cn.getId(), listDay.size());
         request.setAttribute("cts", congtrinhs);
         for (CongTrinh congtrinh : congtrinhs) {
            for (Integer integer : congtrinh.getTimekeeping()) {
                if (integer==1) countAttends+=0.5;
            }
            total+=congtrinh.getTotalmoney();
        }
           Locale vn = new Locale("en", "VN");
            Currency vnmoney = Currency.getInstance(vn);
            NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
            request.setAttribute("total", vnFormat.format(total).substring(3) + " VNĐ");
           request.setAttribute("count", countAttends);
        request.setAttribute("totalday", listDay.size()+1);
      
        request.setAttribute("cts", congtrinhs);
        request.setAttribute("size", congtrinhs.size());
        ArrayList<Integer> listMonth = gd.getMonths();
        ArrayList<Integer> listYear = gd.getYears();
        request.setAttribute("listMonth", listMonth);
        request.setAttribute("listYear", listYear);
        request.getRequestDispatcher("/view/user_attend.jsp").forward(request, response);
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
