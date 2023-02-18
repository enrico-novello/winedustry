<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!DOCTYPE html>
<%@ page import="entities.Regione"%>
<%@ page import="entities.prodotto.Prodotto"%>
<%@ page import="entities.ordine.Carrello"%>
<%@ page import="entities.ordine.CarrelloItem"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<html>

<head>
	<link rel="icon" href="<%=request.getContextPath() %>/home/favicon.ico" type="image/x-icon">
    <title>Carrello Winedustry</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<link href=" https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="cart/cart.css">
    
</head>

<body style="display: unset; background: linear-gradient(109.6deg, rgba(0, 0, 0, 0.93) 11.2%, rgb(63, 61, 61) 78.9%);
background-position: center;
background-size: cover;
background-repeat: no-repeat;
height: 100%;
">
<%@ include file="../HeadFoot/navbar.jsp" %>
	<% Boolean checkout = (Boolean)request.getAttribute("checkout");
	if(checkout==null) checkout=false;
	Carrello carrello = (Carrello)request.getAttribute("carrello");
	List<CarrelloItem> listaProdotti = carrello.getCarrelloItems();
	double totale = 0;%>
        <div class="shopping-cart dark" style="color: white; text-shadow: rgba(204, 204, 204, 0.2) 0px 5px 15px;">
            <div class="container" style="margin-bottom: 15%;">
                <div class="block-heading">
                    <h1>Carrello</h1>
                    <%if(listaProdotti.isEmpty()&&!checkout) {%>
                    	<p>Nessun prodotto presente nel carrello</p>
                    <%} else if(listaProdotti.isEmpty()&&checkout){%>
                    	<h2 style="color: green;">Ordine effettuato !</h2>
                    <%} else{%>
                   		<p>Ecco un riepilogo degli articolo che hai inserito nel tuo carrello</p>
                    <%}%>
                </div>
                <div class="content" style="color: black; box-shadow: 0 8px 32px 0 #b7ac7f;">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="items">
                            	<%for(CarrelloItem item : listaProdotti){ 
                            		totale+=(item.getProdotto().getPrezzo()*item.getQuantita()); %>
                            		<div class="product">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <img class="img-fluid mx-auto d-block image"
                                                src="<%=item.getProdotto().getImmagine()%>">
	                                        </div>
	                                        <div class="col-md-9" style="padding-right: 0px;">
	                                            <div class="info">
	                                                <div class="row">
	                                                    <div class="col-md-5 product-name d-flex align-items-center">
	                                                        <div class="product-name">
	                                                            <a href="ProdottiServlet?prodottoID=<%=item.getProdotto().getId()%>"><%=item.getProdotto().getNome()%></a>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-md-2 quantity d-flex align-items-center justify-content-end" style="text-align: center;">
	                                                        <div class="form-group mb-3" >
								                                <label for="q"><b>Quantita'</b></label>
								                                <select class="form-control" id="q" style="width: auto; margin-left: auto; margin-right: auto;" >
								                                    <option <% if(item.getQuantita() == 1) {%>selected<%}else{} %>>1</option>
								                                    <option <% if(item.getQuantita() == 2) {%>selected<%}else{} %>>2</option>
								                                    <option <% if(item.getQuantita() == 3) {%>selected<%}else{} %>>3</option>
								                                    <option <% if(item.getQuantita() == 4) {%>selected<%}else{} %>>4</option>
								                                    <option <% if(item.getQuantita() == 5) {%>selected<%}else{} %>>5</option>
								                                    <option <% if(item.getQuantita() == 6) {%>selected<%}else{} %>>6</option>
								                                </select>
								                            </div>
	                                                    </div>
	                                                    <div class="col-md-3 price d-flex align-items-center justify-content-end">
	                                                        &euro; <%=Math.round( (item.getProdotto().getPrezzo()*item.getQuantita()) * 100.0 ) / 100.0%>0
	                                                    </div>
	                                                    <div class="col-md-1 d-flex align-items-center justify-item-end">
	                                                    	<form action="InserisciCarrelloItemServlet" method="post">
	                                                    		<button type="submit" style="background-color: transparent; border: none;"><img src="<%=request.getContextPath() %>/cart/bidoncino.jpg" style="width: 80%;"></button>
	                                                    		<input type="hidden" name="cItemID" value="<%=item.getProdotto().getId()%>">
	                                                    	</form>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                            	<%} %>                                                             
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4" style="padding: 0px;">
                            <div class="summary">
                            	<div class="d-fixed" style="position: relative; display: fixed;">
	                                <h3>Riepilogo</h3>
	                                <%if(listaProdotti.isEmpty()) {%>
	                                <div class="summary-item linea">
	                                    <span class="text">Prodotti</span>
	                                    <span class="price">&euro; 0</span>
	                                </div>
	                                <div class="summary-item linea">
	                                    <span class="text">Spedizione</span>
	                                    <span class="price">&euro; 0</span>
	                                </div>
	                                <div class="summary-item">
	                                    <span class="text">Totale</span>
	                                    <span class="price">&euro; 0</span>
	                                </div>
	                                <%}else{ %>
	                                <div class="summary-item linea">
	                                    <span class="text">Prodotti</span>
	                                    <span class="price">&euro; <%=Math.round(totale * 100.0)/ 100.0%>0</span>
	                                </div>
	                                <div class="summary-item linea">
	                                    <span class="text">Spedizione</span>
	                                    <span class="price">&euro; 5.00</span>
	                                </div>
	                                <div class="summary-item">
	                                    <span class="text">Totale</span>
	                                    <span class="price">&euro; <%=Math.round(totale * 100.0)/ 100.0 +5 %>0</span>
	                                </div>
	                                 <%}%>
	                                <form action="CheckoutServlet">
	                                <button type="submit" class="btn btn-primary btn-lg btn-block w-100">Checkout</button>
	                                </form>
	                                <form action="ProdottiServlet" method="post">
	                                <button type="submit" class="btn btn-outline-primary btn-sm btn-block w-100">Continua gli acquisti</button>
	                                </form>
	                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../HeadFoot/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>