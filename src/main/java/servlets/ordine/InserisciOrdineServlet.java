package servlets.ordine;

import java.io.IOException;
import java.util.List;

import entities.Utente;
import entities.ordine.CarrelloItem;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.datasource.UtenteJPA;
import repository.datasource.ordine.CarrelloItemJPA;

@WebServlet("/InserisciOrdineServlet")
public class InserisciOrdineServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Utente utente = new UtenteJPA().findById((Integer) req.getSession().getAttribute("uID"));
		List<CarrelloItem> carrelloItems = utente.getCarrello().get(0).getCarrelloItems();
		carrelloItems.forEach(item -> new CarrelloItemJPA().deleteById(item.getId()));
		req.setAttribute("carrello", utente.getCarrello().get(0));
		req.setAttribute("checkout", true);
		req.getRequestDispatcher("CarrelliServlet").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}