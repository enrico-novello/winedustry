package servlets.ordine;

import java.io.IOException;

import java.util.List;

import entities.ordine.Carrello;
import entities.ordine.CarrelloItem;
import entities.prodotto.Prodotto;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.datasource.UtenteJPA;
import repository.datasource.ordine.CarrelloItemJPA;
import repository.datasource.prodotto.ProdottoJPA;

@WebServlet("/InserisciCarrelloItemServlet")
public class InserisciCarrelloItemServlet extends HttpServlet implements Servlet {

    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int quantita = Integer.parseInt(req.getParameter("pQuantita"));
        Prodotto prodotto = new ProdottoJPA().findById(Integer.parseInt(req.getParameter("pID")));
        int uID = (Integer) req.getSession().getAttribute("uID");
        Carrello carrello = new UtenteJPA().findById(uID).getCarrello().get(0);
        List<CarrelloItem> carrelloItems = carrello.getCarrelloItems();
        for (CarrelloItem carrelloItem : carrelloItems) {
            if (carrelloItem.getProdotto().getId() == prodotto.getId()) {
                carrelloItem.setCarrello(carrello);
                carrelloItem.setProdotto(prodotto);
                carrelloItem.setQuantita(carrelloItem.getQuantita() + quantita);
                new CarrelloItemJPA().update(carrelloItem);
                req.setAttribute("prodotti", new ProdottoJPA().findAll());
                req.getRequestDispatcher("CarrelliServlet").forward(req, resp);
                return;
            }
        }
        new CarrelloItemJPA().save(new CarrelloItem(quantita, carrello, prodotto));
        req.setAttribute("prodotti", new ProdottoJPA().findAll());
        req.getRequestDispatcher("CarrelliServlet").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	Object[] parameters = {new UtenteJPA().findById((Integer) req.getSession().getAttribute("uID")).getCarrello().get(0),new ProdottoJPA().findById(Integer.parseInt(req.getParameter("cItemID")))};
        new CarrelloItemJPA().deleteByMore("where carrello=?1 and prodotto=?2", 2, parameters);
        resp.sendRedirect("CarrelliServlet");
    }
}