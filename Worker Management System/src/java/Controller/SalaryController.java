/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.SalaryDAO;
import function.getDate;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author congfptu
 */
public class SalaryController extends BaseController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SalaryController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SalaryController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
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
        SalaryDAO sl = new SalaryDAO();
        getDate gd = new getDate();
        request.setAttribute("Year", gd.getYears());
        request.setAttribute("month", gd.getMonths());
        request.setAttribute("congnhan", sl.getAllCongNhans());
        request.getRequestDispatcher("/view/salary.jsp").forward(request, response);
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
        SalaryDAO sl = new SalaryDAO();
        String raw_id = request.getParameter("congnhan");
        String raw_salary = request.getParameter("salary");
        String raw_date = request.getParameter("timechange");
        if (raw_id == null || raw_salary == null || raw_date == null) {
        } else {
            int congnhanid = Integer.parseInt(raw_id);
            double salary = Double.parseDouble(raw_salary);
            sl.deleteSalary(congnhanid, raw_date);
            sl.insertSalaryUpdate(congnhanid, salary,raw_date);
        }
        request.setAttribute("message", "Lương Của Công Nhân đã được thay đổi");

        getDate gd = new getDate();
        request.setAttribute("Year", gd.getYears());
        request.setAttribute("month", gd.getMonths());
        request.setAttribute("congnhan", sl.getAllCongNhans());
        request.getRequestDispatcher("/view/salary.jsp").forward(request, response);
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
