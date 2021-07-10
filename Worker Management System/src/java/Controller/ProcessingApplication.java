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
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Application;

/**
 *
 * @author congfptu
 */
public class ProcessingApplication extends BaseController {

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
        ArrayList<Application> apps = ap.getAllApplications(-1);
        request.setAttribute("apps", apps);
        request.setAttribute("size", apps.size());

        request.getRequestDispatcher("view/appProcessing.jsp").forward(request, response);
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
        ApplicationDAO ap = new ApplicationDAO();
        request.setCharacterEncoding("utf-8");
          ArrayList<Application> apps = ap.getAllApplications(-1);
        for (Application app : apps) {
            if (request.getParameter("application" + app.getId()) != null) {
                if (request.getParameter("application"+app.getId()).equals("yes")) {
                    app.setStatus(1);
                } else {
                    app.setStatus(0);
                }
                Date date = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
                app.setDateApproved(formatter.format(date));
                ap.updateApplication(app.getStatus(), app.getDateApproved(), request.getParameter("note" + app.getId()), app.getId());
            }
        }
       ArrayList<Application> appss = ap.getAllApplications(-1);
        request.setAttribute("apps", appss);
        request.setAttribute("size", appss.size());
        request.getRequestDispatcher("view/appProcessing.jsp").forward(request, response);
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
