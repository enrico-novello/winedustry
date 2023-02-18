<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="entities.Indirizzo"%>
<%@ page import="entities.Informazioni"%>
<%@ page import="entities.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
		style="display: flex; align-items: center; justify-content: center; width: 100vw;">
		<div class="profile-container p-4 scroll scroll-3">
			<!-- parte in alto -->
			<div class="container text-center">
				<div class="row justify-content-md-center">
					<div class="col-sm-8">
						<h1 style="margin-top: 10px; margin-bottom: 20px;">Area
							Personale</h1>
						<h5>Dati Utente</h5>
					</div>
<!-- 					<div class="col-sm-2" style="text-align:center;"> -->
<!-- 						<img src="./area-personale/save.png" style="width: 55px; margin-top:5px; margin-bottom:5px;"> -->
<!-- 						<h5 style="font-size:1rem; font-weight: bold; margin-top:5px;">Salva</h5> -->
<!-- 					</div> -->
					<div class="col-sm-2" style="text-align:center; ">
						<a href="UtentiServlet?modifica=true">
						<img src="./area-personale/modifica.png" class="animazione-icona" style="width: 70px; margin:0 auto; ">
						</a>
						<h5 style="font-size:1rem; font-weight: bold; margin-top:5px; ">Modifica</h5>
					</div>
				</div>
			</div>

			<div
				style="display: flex; justify-content: center; align-items: center;">
				<div class="table" style="color: white !important;">
					<!-- tabella anagrafica-->
					<table class="table"  style="color: white !important; text-shadow: 2px 2px 3px rgba(51,51,51,0.7);">
						<tbody class="table-group-divider">
						
							<tr class="spaceUnder">
								<td>Email</td>
								<td><%=utente.getEmail()%></td>
							</tr>
							<tr class="spaceUnder">
								<td>Username</td>
								<td><%=utente.getUsername()%></td>
							</tr>
							<tr class="spaceUnder">
								<td>Nome</td>
								<td>
								<%if(info.getNome()!=null){%>
								<%=info.getNome()%>
								<%}%>
								</td>
							</tr>
							<tr class="spaceUnder">
								<td>Cognome</td>
								<td>
								<%if(info.getCognome()!=null){%>
								<%=info.getCognome()%>
								<%}%>
								</td>
							</tr>
							<tr class="spaceUnder">
								<td>Codice Fiscale</td>
								<td>
								<%if(info.getCodiceFiscale()!=null){%>
								<%=info.getCodiceFiscale()%>
								<%}%>
								</td>
							</tr>
							<tr class="spaceUnder">
								<td>Data di nascita</td>
								<td>
								<%if(info.getDataNascita()!=null){%>
								<%=info.getDataNascita()%>
								<%}%>
								</td>
							</tr>
							<tr class="spaceUnder">
								<td>Telefono</td>
								<td>
								<%if(info.getTelefono()!=null){%>
								<%=info.getTelefono()%>
								<%}%>
								</td>
							</tr>
						</tbody>
					</table>
									<div class="row justify-content-md-center">
					
					<div class="col-sm-8 text-center">
					
						<h5>Indirizzo Utente</h5>

					</div>
					<div class="col-sm-2">
						

					</div>
					</div>
					
					<div class="table">
						<!-- tabella indirizzo-->
						<table class="table"  style="color: white !important; text-shadow: 2px 2px 3px rgba(51,51,51,0.7);">
							<tbody class="table-group-divider">
								<tr class="spaceUnder">
									<td>Via</td>
									<td>
									<%if(ind.getVia()!=null){%>
									<%=ind.getVia()%>
									<%}%>
									</td>
								</tr>
								<tr class="spaceUnder">
									<td>Civico</td>
									<td>
									<%if(ind.getCivico()!=null){%>
									<%=ind.getCivico()%>
									<%}%>
									</td>
								</tr>
								<tr class="spaceUnder">
									<td>Cap</td>
									<td>
									<%if(ind.getCap()!=0){%>
									<%=ind.getCap()%>
									<%}%>
									</td>
								</tr>
								<tr class="spaceUnder">
									<td>Città</td>
									<td>
									<%if(ind.getCitta()!=null){%>
									<%=ind.getCitta()%>
									<%}%>
									</td>
								</tr>
								<tr class="spaceUnder">
									<td>Provincia</td>
									<td>
									<%if(ind.getProvincia()!=null){%>
									<%=ind.getProvincia()%>
									<%}%>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
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