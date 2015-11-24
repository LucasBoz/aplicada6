<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionServico" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionItemServico" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionProduto" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionVenda" %>
<%@ page import="br.edu.udc.aplicada6.entity.Servico" %>
<%@ page import="br.edu.udc.aplicada6.entity.ItemServico" %>
<%@ page import="br.edu.udc.aplicada6.entity.Produto" %>
<%@ page import="br.edu.udc.aplicada6.entity.Venda" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	//ItemServico ItemServico = (ItemServico) request.getAttribute("object");
	//if (ItemServico == null) {
		ItemServico ItemServico = new ItemServico();
	//}
	
	Object listServico[] = (Object[]) request.getAttribute("listServico");
	if (listServico == null) {
		listServico = new Object[0];
	}
	
	Object listProduto[] = (Object[]) request.getAttribute("listProduto");
	if (listProduto == null) {
		listProduto = new Object[0];
	}
	
	Object listItemServico[] = (Object[]) request.getAttribute("listItemServico");
	if (listItemServico == null) {
		listItemServico = new Object[0];
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Manter ItemServico</title>
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
	<div class="divtitulopagina">Add Servicos</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="ItemServico">
			<div class="label">Código:</div>
			
			<div class="field">
				<input value="<%=(ItemServico.getIditemServico() != null) ? ItemServico.getIditemServico() : ""%>" type="text" name="idItemServico" id="idItemServico" style="width:50px;" readOnly maxlength="9">
			</div>
			
			
				<div class="label">Produto:</div>
				
				
			<div class="field">
				<select name="produto" id="produto" onChange="carregar(this)" style="width:150px;">
					<option value=""></option>		
			<%
		for(int i=0; i<listProduto.length; i++) {
			Produto ProdutoAux = (Produto) listProduto[i];
			Boolean bSelected = false;
			if ((ItemServico.getProduto() != null) && 
				(ItemServico.getProduto().getIdProduto() == ProdutoAux.getIdProduto())) {
				bSelected = true;
			}
%>
					<option <%=(bSelected) ? "selected" : "" %> quantidade="<%=ProdutoAux.getQuantidade()%>" valor="<%=ProdutoAux.getValor()%>" value="<%=ProdutoAux.getIdProduto()%>"><%=ProdutoAux.getDescricao()%></option>				
<%
	}
%>
				</select>
			</div>
			
			
			
			
				<div class="label">Servico:</div>
				
				
			<div class="field">
				<select name="servico" id="servico" onChange="carregar(this)" style="width:150px;">
					<option value=""></option>		
			<%
		for(int i=0; i<listServico.length; i++) {
			Servico ServicoAux = (Servico) listServico[i];
			Boolean bSelected = false;
			if ((ItemServico.getServico() != null) && 
				(ItemServico.getServico().getIdServico() == ServicoAux.getIdServico())) {
				bSelected = true;
			}
%>
					<option <%=(bSelected) ? "selected" : "" %> valor="<%=ServicoAux.getValor()%>" value="<%=ServicoAux.getIdServico()%>"><%=ServicoAux.getDescricao()%></option>				
<%
	}
%>
				</select>
			</div>
			<div class="label">Quantidade:</div>
			<div class="field">
				<input value="<%=(ItemServico.getQuantidade() != null) ? ItemServico.getQuantidade() : ""%>" type="text" name="quantidade" id="quantidade"  maxlength="100" readonly>
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(ItemServico.getValor() != null) ? ItemServico.getValor() : ""%>" type="text" name="valor" id="valor" style="width:150px;" maxlength="100">
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

<!-- 						<div class="label">Servico:</div> -->
<!-- 			<div class="field"> -->
<!-- 				<select name="Servico" id="Servico" style="width:150px;"> -->
<!-- 					<option value=""></option> -->
<%
// 	for(int i=0; i<listServico.length; i++) {
// 		Servico ServicoAux = (Servico) listServico[i];
// 		Boolean bSelected = false;
// 		if ((Produto.getServico() != null) && 
// 			(Produto.getServico().getIdServico() == ServicoAux.getIdServico())) {
// 			bSelected = true;
// 		}
%>
<%-- 					<option <%=(bSelected) ? "selected" : "" %> value="<%=ServicoAux.getIdServico() %>"><%=ServicoAux.getIdServico() %></option>	 --%>
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
				<th style="width:450px;">Descricao Servico</th>
				<th style="width:450px;">Descricao Produto</th>
<!-- 				<th>chassi</th> -->
<!-- 				<th>modelo</th> -->
<!-- 				<th>cliente</th> -->
			</tr>
		</table>
				<div class="divtabela">
			<table class="tabelaconteudo">
<%
	for(int i=0; i<listItemServico.length; i++) {
		ItemServico itemServico = (ItemServico) listItemServico[i];
		
		float total =+ itemServico.getValor();	
		if(Integer.parseInt(request.getParameter("id")) == itemServico.getVenda().getIdVenda()){
		
%>		

				<tr>
					<td style="width:60px;"><%=itemServico.getIditemServico() %></td>
					<td style="text-align: left; width:450px;"><%=itemServico.getQuantidade() %></td>
					<td style="text-align: left; width:450px;"><%=itemServico.getValor() %></td>
					<td style="text-align: left; width:450px;"><%=itemServico.getServico().getDescricao() %></td>
					<td style="text-align: left; width:450px;"><%=itemServico.getProduto().getDescricao() %></td>
					<td class="tabelacolunaacao" onclick="removeGrid('<%=itemServico.getIditemServico() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
		}
	}


		
%>
			</table>
		</div>
	</fieldset>
</body>
</html>