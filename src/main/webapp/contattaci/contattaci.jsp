<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="entities.Indirizzo"%>
<%@ page import="entities.Informazioni"%>
<%@ page import="entities.Utente"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="icon" href="<%=request.getContextPath() %>/home/favicon.ico" type="image/x-icon">
<title>Contattaci</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="area-personale/styleareapersonale.css">
</head>
  <body style="background: linear-gradient(109.6deg, rgba(0, 0, 0, 0.93) 11.2%, rgb(63, 61, 61) 78.9%);">
  <%@ include file="../HeadFoot/navbar.jsp"%>
   	<%
   	Boolean contattaci = (Boolean) request.getAttribute("contattaci");
   	if(contattaci==null) contattaci=false;
	Utente utente = (Utente) request.getAttribute("utente");
	Informazioni info = new Informazioni();
	Indirizzo ind = new Indirizzo();

	if (!utente.getInformazioni().isEmpty()) {
		info = utente.getInformazioni().get(0);
	}

	if (!utente.getIndirizzi().isEmpty()) {
		ind = utente.getIndirizzi().get(0);
	}
	%>
<div class="finestrona mt-5"
		style="display: flex; align-items: center; justify-content: center; width: 100vw; text-shadow: 2px 2px 3px rgba(51,51,51,0.7);">
		<div class="profile-container scroll scroll-3">
			<!-- parte in alto -->
			<div class="container text-center">
				<div class="row justify-content-md-center">
					<h1>&bull; Contattaci &bull;</h1>
					<div class="underline"></div>
					<div class="icon_wrapper mt-2" style="text-align: center;">
						<img src="contattaci/iconawinedustry.png" width="50px">
					</div>
				</div>
			</div>
			<div>
				<div class="container text-center" style="width:80%">
				<%if(contattaci){%>
				<p class="mt-3">Grazie per averci contattato, ti risponderemo il prima possibile</p>
				<%}%>
				<form class="mt-3" action="ContattaciServlet">
					<input type="hidden" name="contattaci" value="true">
					<div class="mb-3">
					<label class="form-label">Nome</label>
					<input class="form-control" type="text" <%if(!contattaci){%>value="<%=info.getNome()%>"<%}%>>
					</div>
					<div class="mb-3">
					<label class="form-label">Cognome</label>
					<input class="form-control" type="text" <%if(!contattaci){%>value="<%=info.getCognome()%>"<%}%>>
					</div>
					<div class="mb-3">
					<label class="form-label">E-mail</label>
					<input class="form-control" type="text" <%if(!contattaci){%>value="<%=utente.getEmail()%>"<%}%>>
					</div>
					<div class="mb-3">
					<label class="form-label">Telefono</label>
					<input class="form-control" type="text" <%if(!contattaci){%>value="<%=info.getTelefono()%>"<%}%>>
					</div>
					<div class="mb-3">
					<label class="form-label">Perchè ci scrivi ?</label>
					<select class="form-control" placeholder="Subject line" id="subject_input">
              		<option disabled hidden selected></option>
              		<option>Vorrei avere maggiori informazioni su un prodotto </option>
              		<option>Vorrei avere maggiori informazioni sul mio ordine</option>
             	 	<option>Ho qualche curiosità su di voi o su un vostro prodotto</option>
          			</select>
					</div>
					<div class="mb-3">
					<label class="form-label">Scrivi qui il tuo messaggio</label>
					<textarea class="form-control" id="message_input" cols="30" rows="5"></textarea>
					</div>
					<button class="salva" type="submit"><img class="animazione-icona" src="./contattaci/letter.png"
							style="width: 55px; margin-top: 5px; margin-bottom: 5px;">
						<h5 style="font-size: 1rem; font-weight: bold; margin-top: 5px; color: white;">Invia</h5>
					</button>
				</form>
				</div>
			</div>
		</div>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>