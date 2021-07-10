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
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ChamCong;
import model.CongNhan;
import model.CongTrinh;

/**
 *
 * @author congfptu
 */
public class QuanLiCongTrinh extends BaseController {

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
      request.setAttribute("account", request.getSession().getAttribute("account"));
        CongTrinhDAO db=new CongTrinhDAO();
        DiemDanhDAO dd=new DiemDanhDAO();
             String time = request.getParameter("time");
        String raw_session = request.getParameter("session");
        ArrayList<CongTrinh> cts=db.getCongTrinhs();
        request.setAttribute("cts", cts);
        request.setAttribute("date", java.time.LocalDate.now());
        if(request.getParameter("ct")!=null)
        {
        int congtrinhid=Integer.parseInt(request.getParameter("ct"));
         getDate gd=new getDate();
        ArrayList<CongNhan> cns=db.getCongNhanByCongTrinh(congtrinhid);
        request.setAttribute("ct",congtrinhid);
        request.setAttribute("dates", gd.getDates());
        request.setAttribute("cns", cns);
        request.setAttribute("ctName",request.getParameter("ctName"));
        }
           if (time!=null && raw_session!=null) {
            Date date = Date.valueOf(time);
            int session = Integer.parseInt(raw_session);
            int cid = Integer.parseInt(request.getParameter("ct"));
            request.setAttribute("time",time);
            request.setAttribute("pid",session);
            ArrayList<CongNhan> congnhans = db.getAttendData(date, cid, session);
            request.setAttribute("cnSave", congnhans);
            request.setAttribute("size", congnhans.size());
            request.setAttribute("cid", cid);   
        } 
        getDate gd = new getDate();
        request.setAttribute("dates", gd.getDates());
        request.getRequestDispatcher("view/diemdanh.jsp").forward(request, response);
       
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
            request.setAttribute("account", request.getSession().getAttribute("account"));
                     CongTrinhDAO db=new CongTrinhDAO();
         DiemDanhDAO dd=new DiemDanhDAO();
          String time = request.getParameter("time");
        String raw_session = request.getParameter("session");
         if (time!=null && raw_session!=null) {
         Date date=Date.valueOf(time);
         int pid=Integer.parseInt(raw_session);
         int congtrinhid=Integer.parseInt(request.getParameter("ct"));
         ArrayList<CongNhan> cns=db.getCongNhanByCongTrinh(congtrinhid);
         db.deleteAttend(date, congtrinhid, pid);
         for (CongNhan cn : cns) {
             ChamCong cc=new ChamCong();
            boolean status=request.getParameter("attend"+cn.getId()).equals("present");
            cc.setCongnhanid(cn.getId());
            cc.setCongtrinhid(congtrinhid);
            cc.setSessionid(pid);
            cc.setDate(date);
            cc.setStatus(status);
            db.insertDiemDanh(cc);  
        }     
          }
        ArrayList<CongTrinh> cts=db.getCongTrinhs();
        request.setAttribute("cts", cts);
        request.setAttribute("date", java.time.LocalDate.now());      
          request.setAttribute("mess", "Dữ Liệu Điểm Danh Đã Được Sao Lưu");
          request.getRequestDispatcher("view/diemdanh.jsp").forward(request, response);
         
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     * 
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
