<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="entities.Regione"%>
<%@ page import="entities.prodotto.alcolico.Vino"%>
<%@ page import="java.util.List"%>
<%
Regione regione = (Regione) request.getAttribute("regione");
List<Vino> prodottiRegione = regione.getVini();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="icon" href="<%=request.getContextPath() %>/home/favicon.ico" type="image/x-icon">
<title><%=regione.getNome()%></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="regione/styleregione.css">
<link rel="stylesheet" href="HeadFoot/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

</head>
<body class="corpo">
	<section class="first">
		<%-- 		<%@ include file="../HeadFoot/navbar.jsp" %> --%>
		<div class="outer">
			<div class="inner">
				<div class="bg one">
					<div class="container text-center">
						<a type="button" class="btn btn-outline-light top-0 mb-5"
							href="<%=request.getContextPath()%>/home/home.jsp"> <i
							class="bi bi-arrow-return-left"></i>
						</a>
						<h2 class="section-heading titolino"><%=regione.getNome()%></h2>
						<p style="color: #f8f8f8; font-size: larger; text-shadow: 2px 2px 3px rgba(51,51,51,0.7);"><%=regione.getDescrizione()%></p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="second">
		<div class="outer">
			<div class="inner">
				<div class="bg">
										
					<!-- 					<div class="container section-heading" -->
					<!-- 						style="display: flex; justify-content: center;"> -->
					<!-- 						<div class="row">							 -->
					<%-- 							<% for(int i = 0; i < prodottiRegione.size(); i++){ %> --%>
					<%-- 								<% if(!prodottiRegione.get(i).equals(null) && i<4) { %>							 --%>
					<!-- 								<div class="col"> -->
					<!-- 									<div class="finestracard h-100" > -->
					<!-- 										Product image -->
					<%-- 										<img class="card-img-top" src="<%=prodottiRegione.get(i).getImmagine()%>"/> --%>
					<!-- 										Product details -->
					<!-- 										<div class="card-body p-4"> -->
					<!-- 											<div class="text-center"> -->
					<!-- 												Product name -->
					<%-- 												<h5 class="fw-bolder"><%=prodottiRegione.get(i).getNome() %></h5> --%>
					<!-- 												Product price -->
					<%-- 												&euro;<%=prodottiRegione.get(i).getPrezzo() %> --%>
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 										Product actions -->
					<!-- 										<div class="card-footer border-top-0 bg-transparent"> -->
					<!-- 											<div class="text-center"> -->
					<%-- 												<a class="btn btn-outline-dark mt-auto" href="ProdottiServlet?prodottoID=<%=prodottiRegione.get(i).getId()%>">Vino!</a> --%>
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 								</div> -->
					<%-- 								<% }  --%>
					<%-- 							 } %> --%>
					<!-- 							 <form action="ProdottiServlet" method="post"> -->
					<!-- 							 <button type="submit" class="btn btn btn-outline-light bottom-0 mt-5">Scoprine altri</button> -->
					<!-- 							 </form> -->
					<!-- 						</div> -->
					<!-- 					</div> -->


					<div class="container px-4 px-lg-5 mt-5 section-heading">
						<h2 class="fw-bolder mb-4"
							style="color: white; text-shadow: 2px 2px 3px rgba(51, 51, 51, 0.7);">Vini
							Della Regione</h2>
						<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<%
							for (int i = 0; i < prodottiRegione.size(); i++) {
							%>
							<%
							if (!prodottiRegione.get(i).equals(null) && i < 4) {
							%>
							<div class="col mb-5">
								<!-- Primo prodotto-->
								<div class="card h-100" style="box-shadow: rgba(204, 204, 204, 0.35) 0px 5px 15px; color: black;">
									<!-- Product image-->
									<img class="card-img-top" src="<%=prodottiRegione.get(i).getImmagine()%>" alt="..." />
									<!-- Product details-->
									<div class="card-body">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder"><%=prodottiRegione.get(i).getNome()%></h5>
											<!-- Product price-->
											&euro;<%=prodottiRegione.get(i).getPrezzo() + "0"%>
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto"
												href="ProdottiServlet?prodottoID=<%=prodottiRegione.get(i).getId()%>">Vino!</a>
										</div>
									</div>
								</div>
							</div>
							<%
							}
							}
							%>
							<form action="ProdottiServlet" method="post" class="text-center top-0 w-100">
								<button type="submit" class="btn btn btn-outline-light text-center w-100">Scoprine altri</button>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="third">
		<div class="outer">
			<div class="inner">
				<div class="bg"></div>
			</div>
		</div>
	</section>

	<script src='https://assets.codepen.io/16327/gsap-latest-beta.min.js'></script>
	<script src='https://assets.codepen.io/16327/Observer.min.js'></script>
	<script
		src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/SplitText3.min.js'></script>
	<script src="regione/scriptregione.js"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	<!-- 	<script src="regione/scriptmenu.js"></script> -->
</body>
</html>
