<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="entities.Indirizzo"%>
<%@ page import="entities.Informazioni"%>
<%@ page import="entities.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="<%=request.getContextPath() %>/home/favicon.ico" type="image/x-icon">
<title>Area Personale</title>
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
	<!-- qui inizia la finestra dell'area personale -->
	<div class="finestrona mt-5"
		style="display: flex; align-items: center; justify-content: center; width: 100vw; text-shadow: 2px 2px 3px rgba(51,51,51,0.7);">
		<div class="profile-container scroll scroll-3">
			<!-- parte in alto -->
			<div class="container text-center">
				<div class="row justify-content-md-center">
					<div>
						<h1 style="margin-top: 10px; margin-bottom: 20px;">Area
							Personale</h1>
						<h5>Dati Utente</h5>
					</div>
				</div>
			</div>
			<div>
				<div class="container text-center" style="width:80%">
				<form class="" action="ModificaUtenteServlet">
					<div class="mb-3">
					<label class="form-label">Nome</label>
					<input class="form-control" type="text" <%if(info.getNome()!=null){%>value="<%=info.getNome()%>"<%}%> name="uNome" >
					</div>
					<div class="mb-3">
					<label class="form-label">Cognome</label>
					<input class="form-control" type="text" <%if(info.getCognome()!=null){%>value="<%=info.getCognome()%>"<%}%> name="uCognome">
					</div>
					<div class="mb-3">
					<label class="form-label">Codice Fiscale</label>
					<input class="form-control" type="text" <%if(info.getCodiceFiscale()!=null){%>value="<%=info.getCodiceFiscale()%>"<%}%> name="uCodiceFiscale">
					</div>
					<div class="mb-3">
					<label class="form-label">Data di Nascita</label>
					<input class="form-control" type="text" placeholder="aaaa-mm-gg" <%if(info.getDataNascita()!=null){%>value="<%=info.getDataNascita()%>"<%}%> name="uDataNascita">
					</div>
					<div class="mb-3">
					<label class="form-label">Telefono</label>
					<input class="form-control" type="text" <%if(info.getTelefono()!=null){%>value="<%=info.getTelefono()%>"<%}%> name="uTelefono">
					</div>
					<div class="text-center mt-4">
						<h5>Indirizzo Utente</h5>
					</div>
					<div class="mb-3">
					<label class="form-label">Via</label>
					<input class="form-control" type="text" <%if(ind.getVia()!=null){%>value="<%=ind.getVia()%>"<%}%> name="uVia">
					</div>
					<div class="mb-3">
					<label class="form-label">Civico</label>
					<input class="form-control" type="text" <%if(ind.getCivico()!=null){%>value="<%=ind.getCivico()%>"<%}%> name="uCivico">
					</div>
					<div class="mb-3">
					<label class="form-label">Cap</label>
					<input class="form-control" type="text" <%if(ind.getCap()!=0){%>value="<%=ind.getCap()%>"<%}%> name="uCap">
					</div>
					<div class="mb-3">
					<label class="form-label">Città</label>
					<input class="form-control" type="text" <%if(ind.getCitta()!=null){%>value="<%=ind.getCitta()%>"<%}%> name="uCitta">
					</div>
					<div class="mb-3">
					<label class="form-label">Provincia</label>
					<input class="form-control" type="text" <%if(ind.getProvincia()!=null){%>value="<%=ind.getProvincia()%>"<%}%> name="uProvincia">
					</div>
					<button class="salva" type="submit"><img class="animazione-icona" src="./area-personale/save.png"
							style="width: 55px; margin-top: 5px; margin-bottom: 5px;">
						<h5 style="font-size: 1rem; font-weight: bold; margin-top: 5px; color: white;">Salva</h5>
					</button>
				</form>
				</div>
			</div>
		</div>
	</div>
	<!-- questo div chiude finestrona -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>