/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vista;

import com.sv.udb.controlador.PersonasCtrl;
import com.sv.udb.modelo.Personas;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Alexander José
 */
@WebServlet(name = "PersonasServ", urlPatterns = {"/PersonasServ"})
@MultipartConfig(maxFileSize = 16177215)
public class PersonasServ extends HttpServlet {

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
        boolean esValido = request.getMethod().equals("POST");
        if (esValido) {
            String mens = "";
            String CRUD = request.getParameter("cursBton");
            switch (CRUD) {
                case "Guardar": {                    
                    Personas obje = new Personas();
                    PersonasCtrl obje2 = new PersonasCtrl();
                    obje.setIdPers(obje2.consNum() + 1);
                    obje.setNombPers(request.getParameter("Nombre"));
                    obje.setApelPers(request.getParameter("Apellidos"));
                    InputStream Foto = null;
                    Part filePart = request.getPart("Foto");
                    if (filePart != null) {
                        Foto = filePart.getInputStream();
                    }
                    obje.setIdTipo(Integer.parseInt(request.getParameter("cmbTipo")));
                    obje.setGenePers(request.getParameter("cmbGene"));
                    obje.setFechNaci(request.getParameter("Naci"));
                    obje.setDui(request.getParameter("DUI"));
                    obje.setNit(request.getParameter("NIT"));
                    obje.setTipoSangre(request.getParameter("TipoSang"));
                    obje.setIdDirec(Integer.parseInt(request.getParameter("cmbDirec")));
                    Date ahora = new Date();
                    Calendar Calendario = new GregorianCalendar();
                    String FechNaci = ahora.getDate() + "-" + (ahora.getMonth() + 1) + "-" + (ahora.getYear() + 1900) + " " + Calendario.get(Calendar.HOUR_OF_DAY) + ":" + Calendario.get(Calendar.MINUTE) + ":" + Calendario.get(Calendar.SECOND);
                    mens = new PersonasCtrl().guar(obje, Foto, FechNaci) ? "Datos guardados." : "Datos NO guardados.";
                    break;
                }
                /*case "Consultar": {
                    int codiProv = Integer.parseInt(request.getParameter("codiProvRadi") == null ? "0" : request.getParameter("codiProvRadi"));
                    Proveedores obje = new ProveedoresCtrl().cons(codiProv);
                    if (obje != null) {
                        request.setAttribute("codiProv", obje.getIdProv());
                        request.setAttribute("nombProv", obje.getNombProv());
                        request.setAttribute("direProv", obje.getDireProv());
                        request.setAttribute("teleProv", obje.getTeleProv());
                    }
                    break;
                }
                case "Modificar": {
                    String valor = request.getParameter("codiProv");
                    if (!valor.equals("")) {
                        Proveedores obje = new Proveedores();
                        obje.setIdProv(Integer.parseInt(request.getParameter("codiProv")));
                        obje.setNombProv(request.getParameter("nombProv"));
                        obje.setDireProv(request.getParameter("direProv"));
                        obje.setTeleProv(request.getParameter("teleProv"));
                        mens = new ProveedoresCtrl().actu(obje) ? "Datos modificados." : "Datos NO modificados.";
                    } else {
                        mens = "Seleccione un dato.";
                    }
                    break;
                }
                case "Eliminar": {
                    String valor = request.getParameter("codiProv");
                    if (!valor.equals("")) {
                        Proveedores obje = new Proveedores();
                        obje.setIdProv(Integer.parseInt(request.getParameter("codiProv")));
                        mens = new ProveedoresCtrl().elim(obje) ? "Datos eliminados." : "Datos NO eliminados.";
                    } else {
                        mens = "Seleccione un dato.";
                    }
                    break;
                }*/
                default:
                    break;
            }
            request.setAttribute("mensAlert", mens);
            request.getRequestDispatcher("/Personas.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Personas.jsp");
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
