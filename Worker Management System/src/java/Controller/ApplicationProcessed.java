/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.ApplicationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class ApplicationProcessed extends BaseController {

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
       request.setCharacterEncoding("utf-8");
        ApplicationDAO ap = new ApplicationDAO();
        String p_index = request.getParameter("page");
       CongNhan cn = (CongNhan) request.getSession().getAttribute("congnhan");
        if(p_index ==null)
            p_index = "1";
        int pageindex = Integer.parseInt(p_index);
        int num_records = ap.countApplication();
        int totalpage = (num_records%5 ==0)
                ?num_records/5
                :(num_records/5)+1;
        ArrayList<Application> apps = ap.getApplicationProcessed(pageindex,5);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("apps", apps);
        request.setAttribute("size", apps.size());
        request.getRequestDispatcher("view/applicationProcessed.jsp").forward(request, response);
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
