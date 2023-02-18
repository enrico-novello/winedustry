package servlets;

import entities.Utente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.datasource.UtenteJPA;

import java.io.IOException;

import java.util.List;

@WebServlet("/UtentiServlet")
public class UtentiServlet extends HttpServlet {

    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String modifica = req.getParameter("modifica");
        int uID = (Integer) req.getSession().getAttribute("uID");
        Utente utente = new UtenteJPA().findById(uID);
        if (utente != null) {
            req.setAttribute("utente", utente);
            if(modifica==null) {
            	req.getRequestDispatcher("area-personale/area-personale.jsp").forward(req, resp);
            } else {
            	req.getRequestDispatcher("area-personale/modifica-dati-utente.jsp").forward(req, resp);
            }
        } else {
            resp.sendRedirect("home/home.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Utente> utenti = new UtenteJPA().findAll();
        if (!utenti.isEmpty()) {
            req.setAttribute("utenti", utenti);
            req.getRequestDispatcher("utenti.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("index.jsp");
        }
    }

}
