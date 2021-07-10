/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.ApplicationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Application;
import model.CongNhan;

/**
 *
 * @author congfptu
 */
public class ApplicationController extends BaseController {

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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       request.getRequestDispatcher("view/application.jsp").forward(request, response);
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
          request.setCharacterEncoding("utf-8");
        ApplicationDAO ap=new ApplicationDAO();
       CongNhan congnhan=(CongNhan) request.getSession().getAttribute("congnhan");
       String content=request.getParameter("content");
       if(content!=null)
       {        
           Application a=new Application();
           a.setCongnhan(congnhan);
           a.setContent(content);
           Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
          a.setDateSubmit(formatter.format(date));
          a.setStatus(-1);
          ap.insertApplication(a);
       }
       request.setAttribute("mess", "Đơn của bạn đã dược gửi đi");
       request.getRequestDispatcher("view/application.jsp").forward(request, response);
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
