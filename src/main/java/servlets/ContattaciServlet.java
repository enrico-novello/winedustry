package servlets;

import java.io.IOException;

import entities.Utente;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.datasource.UtenteJPA;

@WebServlet("/ContattaciServlet")
public class ContattaciServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getParameter("contattaci") != null) {
			req.setAttribute("contattaci", true);
		}
		Utente utente = new UtenteJPA().findById((Integer) req.getSession().getAttribute("uID"));
		utente.getInformazioni().get(0);
		utente.getIndirizzi().get(0);
		req.setAttribute("utente", utente);
		req.getRequestDispatcher("contattaci/contattaci.jsp").forward(req, resp);
	}

}