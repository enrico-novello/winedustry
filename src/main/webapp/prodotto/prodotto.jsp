<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entities.Regione"%>
<%@ page import="entities.prodotto.Prodotto"%>
<%@ page import="entities.Utente"%>
<%@ page import="entities.prodotto.alcolico.Vino"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" href="<%=request.getContextPath() %>/home/favicon.ico" type="image/x-icon">
        <title>Shop Item - Winedustry</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
<!--         <link href="prodotto/styleheader.css" rel="stylesheet"/> -->
        <link href="HeadFoot/style.css" rel="stylesheet" />
    </head>
    <body style="background: linear-gradient(109.6deg, rgba(0, 0, 0, 0.93) 11.2%, rgb(63, 61, 61) 78.9%); font-family: 'Merriweather', serif;">
    	<% Vino vino = (Vino) request.getAttribute("prodotto");
    		Utente utente = (Utente)request.getSession().getAttribute("utente");%>
        <!-- Navigation-->
        <%@ include file="../HeadFoot/navbar.jsp" %>
        
        <!-- Product section-->
        <div class="container">
            <div class="row gx-4 gx-lg-5 align-items-center" style="margin-top: 5%;">
                <div class="col-md-6">
                <img class="card-img-top mb-5 mb-md-0" style="border-radius: 15px; box-shadow: rgba(204, 204, 204, 0.35) 0px 5px 15px;"
                src="<%=vino.getImmagine() %>" >
                </div>
                <div class="col-md-6" style="color: white; text-shadow: 2px 2px 3px rgba(51,51,51,0.7);">
                    <h1 class="display-5 fw-bolder"><%=vino.getNome() %></h1>
                    <div class="fs-5" style="margin-bottom: 2rem !important; margin-top: 1.5rem !important;">
<%--                         <span class="text-decoration-line-through">&euro; <%=vino.getPrezzo() + 2.99 %></span> --%>
                        <span style="font-size: larger;"><b>&euro; <%=vino.getPrezzo() + "0" %></b></span>
                    </div>
                    <p class="lead">
                    	<ul style="list-style-type: none; padding-left: 0rem; margin-bottom: 2rem; font-size: 150%; border: 1px solid #cccccc; padding: 5%; border-radius: 15px;">
                            <li><b><i class="bi bi-geo-alt"></i> Regione: </b><%=vino.getRegione().getNome() %></li>
                            <li><b><i class="bi bi-calendar"></i> Annata: </b><%=vino.getAnnata() %></li>
                            <li><b><i class="bi bi-tag"></i> Categoria: </b><%=vino.getCategoria() %></li>
                            <li><b><i class="bi bi-trophy"></i> Vitigno: </b><%=vino.getVitigno() %></li>
                            <li><b><i class="bi bi-aspect-ratio"></i> Formato: </b><%=vino.getFormato() %></li>
                            <li><b><i class="bi bi-percent"></i> Gradazione: </b><%=vino.getGradazione() %></li>
                        </ul>
                    </p>
                    <div class="d-inline">
                    	<form action="InserisciCarrelloItemServlet" method="get">
<!-- 	                    	<div style="display: inline-block; vertical-align: middle; margin-right: 0.5rem;"> -->
<%-- 		                    	<input type="hidden" name="pID" value="<%=vino.getId()%>"> --%>
<!-- 		                        <input class="form-control text-center" id="inputQuantity" type="number" value="1" name="pQuantita" style="width: 5rem"/> -->
<!-- 		                    </div> -->
							<div class="mb-1">
								<label for="q"><b>Quantita'</b></label>   
		                    </div>
		                    <div class="form-group" style="display: inline-block; vertical-align: middle; margin-right: 1rem; margin-left: 1rem; ">                               
                                <input type="hidden" name="pID" value="<%=vino.getId()%>">                 
                                <select name="pQuantita" class="form-control" id="q" style=" margin-left: auto; margin-right: auto;" >
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                </select>
                            </div>
		                    <div style="display: inline-block; vertical-align: middle;">
		                        <button class="btn btn-outline-light ml-2" type="submit">
		                            <i class="bi-cart-fill me-1"></i>
		                            Aggiungi al carrello</button>
	                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col w-100 mt-5" style="color: white; text-shadow: 2px 2px 3px rgba(51,51,51,0.7);">
        		<h2 class="mb-3">Perche' ci piace</h2>
        		<div style="list-style-type: none; padding-left: 0rem; margin-bottom: 2rem; font-size: 150%; border: 1px solid #cccccc; padding: 3%; border-radius: 15px;">
        			<%=vino.getDescrizione() %>
        		</div>
        	</div>
        </div>
        
        <!-- Related items section-->
        <%  List<Vino> prodottiPerRegione = vino.getRegione().getVini(); %>
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="fw-bolder mb-4" style="color: white; text-shadow: 2px 2px 3px rgba(51,51,51,0.7);">Altri vini simili</h2>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            	<% for(int i = 0; i < prodottiPerRegione.size(); i++ ){
            		if(!prodottiPerRegione.get(i).equals(null) && i < 4){ %>      	
                <div class="col mb-5">
                	<!-- Primo prodotto-->
                    <div class="card h-100" style="box-shadow: rgba(204, 204, 204, 0.35) 0px 5px 15px;">
                        <!-- Product image-->
                        <img class="card-img-top" src="<%= prodottiPerRegione.get(i).getImmagine() %>" alt="..." />
                        <!-- Product details-->
                        <div class="card-body">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder"><%=prodottiPerRegione.get(i).getNome() %></h5>
                                <!-- Product price-->
                                &euro;<%=prodottiPerRegione.get(i).getPrezzo()+"0"%>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="ProdottiServlet?prodottoID=<%=prodottiPerRegione.get(i).getId() %>">Vino!</a></div>
                        </div>
                    </div>
                 </div>
                 <%}
           		}%>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="script.js"></script>
        <%@include file="../HeadFoot/footer.jsp" %>
    </body>
</html>
