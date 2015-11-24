<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionCompra" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionItemCompra" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionProduto" %>
<%@ page import="br.edu.udc.aplicada6.entity.Compra" %>
<%@ page import="br.edu.udc.aplicada6.entity.ItemCompra" %>
<%@ page import="br.edu.udc.aplicada6.entity.Produto" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	//ItemCompra ItemCompra = (ItemCompra) request.getAttribute("object");
	//if (ItemCompra == null) {
		ItemCompra ItemCompra = new ItemCompra();
	//}
	
	
	Object listCompra[] = (Object[]) request.getAttribute("listCompra");
	if (listCompra == null) {
		listCompra = new Object[0];
	}
	
	Object listProduto[] = (Object[]) request.getAttribute("listProduto");
	if (listProduto == null) {
		listProduto = new Object[0];
	}
	
	Object listItemCompra[] = (Object[]) request.getAttribute("listItemCompra");
	if (listItemCompra == null) {
		listItemCompra = new Object[0];
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Manter ItemCompra</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	
	<script type="text/javascript" src="./css/jquery.js"></script>
	<script type="text/javascript">	
		function carregar(atr){
			var quantidade = $('option:selected', atr).attr('quantidade');
			var valor = $('option:selected', atr).attr('valor');
			$("#quantidade").val(quantidade);
			$("#valor").val(valor);
			
		}
	
	
		function validateFields() {
			if (document.getElementById("produto").value == "") {
				alert("Selecione um produto");
				document.getElementById("produto").focus();
				return false;
			}
			if (document.getElementById("valor").value == "") {
				alert("valor é obrigatória!");
				document.getElementById("quantidade").focus();
				return false;
			}

// 			if (document.getElementById("marca").value == "") {
// 				alert("Marca é obrigatória!");
// 				document.getElementById("marca").focus();
// 				return false;
// 			}
			return true;
		}
		
		function save() {
			if (validateFields()) {
				document.getElementById("newAction").value = "save";
				document.getElementById("form").submit();
			}
		}
		
		function clean() {
			document.getElementById("newAction").value = "goNew";
			document.getElementById("form").submit();
		}
		
		function goFind() {
			document.getElementById("newAction").value = "goFind";
			document.getElementById("form").submit();
		}
		
		function removeObject() {
			if (confirm("Deseja Apagar o Registro?")) {
				document.getElementById("newAction").value = "remove";
				document.getElementById("form").submit();
			}
		}
		function voutar(id) {
			document.getElementById("entityName").value = "Compra"
			document.getElementById("newAction").value = "goFind";
			//document.getElementById("id").value = id;
			document.getElementById("form").submit();
		}	
		
		function removeGrid(id) {
			if (confirm("Deseja Apagar o Registro?")) {
				document.getElementById("newAction").value = "remove";
				document.getElementById("id").value = id;
				document.getElementById("form").submit();
			}
		}
		function message() {
<%
	if (mensagem != null) {
%>
			alert("<%=mensagem %>");
<%
	}
%>
		}
	</script>	
</head>
<body onload="message();">
	<div class="divtitulopagina">Add Items</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="id" id="id">
			<input type="hidden" value="<%=request.getParameter("idcompra") %>" name="idcompra" id="idcompra">
			
			<input type="hidden" name="entityName" id="entityName" value="ItemCompra">
			<div class="label">Código:</div>
			
			<div class="field">
				<input value="<%=(ItemCompra.getIditemCompra() != null) ? ItemCompra.getIditemCompra() : ""%>" type="text" name="idItemCompra" id="idItemCompra" style="width:50px;" readOnly maxlength="9">
			</div>
			
			
				<div class="label">Produto:</div>
				
				
			<div class="field">
				<select name="produto" id="produto" onChange="carregar(this)" style="width:150px;">
					<option value=""></option>		
			<%
		for(int i=0; i<listProduto.length; i++) {
			Produto ProdutoAux = (Produto) listProduto[i];
			Boolean bSelected = false;
			if ((ItemCompra.getProduto() != null) && 
				(ItemCompra.getProduto().getIdProduto() == ProdutoAux.getIdProduto())) {
				bSelected = true;
			}
%>
					<option <%=(bSelected) ? "selected" : "" %> quantidade="<%=ProdutoAux.getQuantidade()%>" valor="<%=ProdutoAux.getValor()%>" value="<%=ProdutoAux.getIdProduto()%>"><%=ProdutoAux.getDescricao()%></option>				
<%
	}
%>
				</select>
			</div>
			
			
			<div class="label">Quantidade:</div>
			<div class="field">
				<input value="<%=(ItemCompra.getQuantidade() != null) ? ItemCompra.getQuantidade() : ""%>" type="text" name="quantidade" id="quantidade"  maxlength="100" readonly>
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(ItemCompra.getValor() != null) ? ItemCompra.getValor() : ""%>" type="text" name="valor" id="valor" style="width:150px;" maxlength="100">
			</div>
			
			<div class="label">Compra:</div>
			<div class="field">
			
				<input name="Compra" id="Compra" readonly style="width:150px;" value="<%=request.getParameter("idcompra")%>" >

			</div>
			
			
			
			
<!-- 			<div class="label">Placa:</div> -->
<!-- 			<div class="field"> -->
<%-- 				<input value="<%=(Produto.getPlaca() != null) ? Produto.getPlaca() : ""%>" type="text" name="placa" id="placa" style="width:400px;" maxlength="100"> --%>
<!-- 			</div> -->
<!-- 			<div class="label">Chassi:</div> -->
<!-- 			<div class="field"> -->
<%-- 				<input value="<%=(Produto.getChassi() != null) ? Produto.getChassi() : ""%>" type="text" name="chassi" id="chassi" style="width:400px;" maxlength="100"> --%>
<!-- 			</div> -->

<!-- 						<div class="label">Compra:</div> -->
<!-- 			<div class="field"> -->
<!-- 				<select name="Compra" id="Compra" style="width:150px;"> -->
<!-- 					<option value=""></option> -->
<%
// 	for(int i=0; i<listCompra.length; i++) {
// 		Compra CompraAux = (Compra) listCompra[i];
// 		Boolean bSelected = false;
// 		if ((Produto.getCompra() != null) && 
// 			(Produto.getCompra().getIdCompra() == CompraAux.getIdCompra())) {
// 			bSelected = true;
// 		}
%>
<%-- 					<option <%=(bSelected) ? "selected" : "" %> value="<%=CompraAux.getIdCompra() %>"><%=CompraAux.getIdCompra() %></option>	 --%>
<%
// 	}
%>
<!-- 				</select> -->
<!-- 			</div> -->
			<div class="divbotoes">
				<input type="button" value="Add o Item" onclick="save();">
				
				<input type="button" value="Voltar" onclick="voutar(<%=request.getParameter("idcompra")%>);">
			</div>
		</form>
		
				<table class="tabelatitulo">
			<tr>
				<th style="width:60px;">Código</th>
				<th style="width:450px;">Quantidade</th>
				<th style="width:450px;">valor</th>
				<th style="width:450px;">Descricao</th>
<!-- 				<th>chassi</th> -->
<!-- 				<th>modelo</th> -->
<!-- 				<th>cliente</th> -->
			</tr>
		</table>
				<div class="divtabela">
			<table class="tabelaconteudo">
<%
	if(request.getParameter("idcompra") !=""){

	for(int i=0; i<listItemCompra.length; i++) {
		ItemCompra itemCompra = (ItemCompra) listItemCompra[i];
		
		float total =+ itemCompra.getValor();	
		if(Integer.parseInt(request.getParameter("idcompra")) == itemCompra.getCompra().getIdCompra() && request.getParameter("idcompra") != ""){
		
%>		

				<tr>
					<td style="width:60px;"><%=itemCompra.getIditemCompra() %></td>
					<td style="text-align: left; width:450px;"><%=itemCompra.getQuantidade() %></td>
					<td style="text-align: left; width:450px;"><%=itemCompra.getValor() %></td>
					<td style="text-align: left; width:450px;"><%=itemCompra.getProduto().getDescricao() %></td>
					
					<td class="tabelacolunaacao" onclick="removeGrid('<%=itemCompra.getIditemCompra() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
		}
	}
	}

		
%>
			</table>
		</div>
	</fieldset>
</body>
</html>