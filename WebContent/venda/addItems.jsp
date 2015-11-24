<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionVenda" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionItemVenda" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionProduto" %>
<%@ page import="br.edu.udc.aplicada6.entity.Venda" %>
<%@ page import="br.edu.udc.aplicada6.entity.ItemVenda" %>
<%@ page import="br.edu.udc.aplicada6.entity.Produto" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	//ItemVenda ItemVenda = (ItemVenda) request.getAttribute("object");
	//if (ItemVenda == null) {
		ItemVenda ItemVenda = new ItemVenda();
	//}
	
	Object listVenda[] = (Object[]) request.getAttribute("listVenda");
	if (listVenda == null) {
		listVenda = new Object[0];
	}
	
	Object listProduto[] = (Object[]) request.getAttribute("listProduto");
	if (listProduto == null) {
		listProduto = new Object[0];
	}
	
	Object listItemVenda[] = (Object[]) request.getAttribute("listItemVenda");
	if (listItemVenda == null) {
		listItemVenda = new Object[0];
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Manter ItemVenda</title>
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
			document.getElementById("entityName").value = "Venda"
			document.getElementById("newAction").value = "goFind";
			//document.getElementById("id").value = id;
			document.getElementById("form").submit();
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
			<input type="hidden" name="entityName" id="entityName" value="ItemVenda">
			<div class="label">Código:</div>
			
			<div class="field">
				<input value="<%=(ItemVenda.getIditemVenda() != null) ? ItemVenda.getIditemVenda() : ""%>" type="text" name="idItemVenda" id="idItemVenda" style="width:50px;" readOnly maxlength="9">
			</div>
			
			
				<div class="label">Produto:</div>
				
				
			<div class="field">
				<select name="produto" id="produto" onChange="carregar(this)" style="width:150px;">
					<option value=""></option>		
			<%
		for(int i=0; i<listProduto.length; i++) {
			Produto ProdutoAux = (Produto) listProduto[i];
			Boolean bSelected = false;
			if ((ItemVenda.getProduto() != null) && 
				(ItemVenda.getProduto().getIdProduto() == ProdutoAux.getIdProduto())) {
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
				<input value="<%=(ItemVenda.getQuantidade() != null) ? ItemVenda.getQuantidade() : ""%>" type="text" name="quantidade" id="quantidade"  maxlength="100" readonly>
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(ItemVenda.getValor() != null) ? ItemVenda.getValor() : ""%>" type="text" name="valor" id="valor" style="width:150px;" maxlength="100">
			</div>
			
			<div class="label">Venda:</div>
			<div class="field">
			
				<input name="venda" id="venda" readonly style="width:150px;" value="<%=request.getParameter("id")%>" >

			</div>
			
			
			
			
<!-- 			<div class="label">Placa:</div> -->
<!-- 			<div class="field"> -->
<%-- 				<input value="<%=(Produto.getPlaca() != null) ? Produto.getPlaca() : ""%>" type="text" name="placa" id="placa" style="width:400px;" maxlength="100"> --%>
<!-- 			</div> -->
<!-- 			<div class="label">Chassi:</div> -->
<!-- 			<div class="field"> -->
<%-- 				<input value="<%=(Produto.getChassi() != null) ? Produto.getChassi() : ""%>" type="text" name="chassi" id="chassi" style="width:400px;" maxlength="100"> --%>
<!-- 			</div> -->

<!-- 						<div class="label">Venda:</div> -->
<!-- 			<div class="field"> -->
<!-- 				<select name="Venda" id="Venda" style="width:150px;"> -->
<!-- 					<option value=""></option> -->
<%
// 	for(int i=0; i<listVenda.length; i++) {
// 		Venda VendaAux = (Venda) listVenda[i];
// 		Boolean bSelected = false;
// 		if ((Produto.getVenda() != null) && 
// 			(Produto.getVenda().getIdVenda() == VendaAux.getIdVenda())) {
// 			bSelected = true;
// 		}
%>
<%-- 					<option <%=(bSelected) ? "selected" : "" %> value="<%=VendaAux.getIdVenda() %>"><%=VendaAux.getIdVenda() %></option>	 --%>
<%
// 	}
%>
<!-- 				</select> -->
<!-- 			</div> -->
			<div class="divbotoes">
				<input type="button" value="Add o Item" onclick="save();">
				<input type="button" value="Voltar" onclick="voutar(<%=request.getParameter("id")%>);">
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
	for(int i=0; i<listItemVenda.length; i++) {
		ItemVenda itemVenda = (ItemVenda) listItemVenda[i];
		
		float total =+ itemVenda.getValor();	
		if(Integer.parseInt(request.getParameter("id")) == itemVenda.getVenda().getIdVenda()){
		
%>		

				<tr>
					<td style="width:60px;"><%=itemVenda.getIditemVenda() %></td>
					<td style="text-align: left; width:450px;"><%=itemVenda.getQuantidade() %></td>
					<td style="text-align: left; width:450px;"><%=itemVenda.getValor() %></td>
					<td style="text-align: left; width:450px;"><%=itemVenda.getProduto().getDescricao() %></td>
					
					<td class="tabelacolunaacao" onclick="detail('<%=itemVenda.getIditemVenda() %>');"><img src="./img/detail.gif" /></td>
					<td class="tabelacolunaacao" onclick="removeGrid('<%=itemVenda.getIditemVenda() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
		}
	}


		
%>
			VALOR TOTAL : <%=%>
			</table>
		</div>
	</fieldset>
</body>
</html>