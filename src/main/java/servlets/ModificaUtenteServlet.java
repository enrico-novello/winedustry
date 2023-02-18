package servlets;

import java.io.IOException;
import java.time.LocalDate;

import entities.Indirizzo;
import entities.Informazioni;
import entities.Utente;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.datasource.IndirizzoJPA;
import repository.datasource.InformazioniJPA;
import repository.datasource.UtenteJPA;

@WebServlet("/ModificaUtenteServlet")
public class ModificaUtenteServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String nome = req.getParameter("uNome");
        String cognome = req.getParameter("uCognome");
        String codiceFiscale = req.getParameter("uCodiceFiscale");
        LocalDate dataNascita = LocalDate.parse(req.getParameter("uDataNascita"));
        String telefono = req.getParameter("uTelefono");
		String via = req.getParameter("uVia");
        String civico = req.getParameter("uCivico");
        int cap = Integer.parseInt(req.getParameter("uCap"));
        String citta = req.getParameter("uCitta");
        String provincia = req.getParameter("uProvincia");
        int uID = (Integer) req.getSession().getAttribute("uID");
        
        Utente utente = new UtenteJPA().findById(uID);
        
        Informazioni informazione = new Informazioni();
        informazione.setNome(nome);
        informazione.setCognome(cognome);
        informazione.setCodiceFiscale(codiceFiscale);
        informazione.setDataNascita(dataNascita);
        informazione.setTelefono(telefono);
        
        Indirizzo indirizzo = new Indirizzo();
        indirizzo.setVia(via);
        indirizzo.setCivico(civico);
        indirizzo.setCap(cap);
        indirizzo.setCitta(citta);
        indirizzo.setProvincia(provincia);
        
        if (!utente.getInformazioni().isEmpty()){
            new InformazioniJPA().update(informazione);
        } else {
            new InformazioniJPA().save(new Informazioni(nome, cognome, codiceFiscale, dataNascita, telefono, utente));
        }
        if (!utente.getIndirizzi().isEmpty()) {
            new IndirizzoJPA().update(indirizzo);
        } else {
            new IndirizzoJPA().save(new Indirizzo(via, civico, cap, citta, provincia, utente));
        }
        
        resp.sendRedirect("UtentiServlet");
        
	}

}