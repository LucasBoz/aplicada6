<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionProduto" %>
<%@ page import="br.edu.udc.aplicada6.entity.Produto" %>
<%
	Produto produtoFilter = (Produto) request.getSession().getAttribute("filterProduto");
	if (produtoFilter == null) {
		produtoFilter = new Produto();
	}
	Object listProduto[] = (Object[]) request.getAttribute("list");
	if (listProduto == null) {
		listProduto = new Object[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Consultar Produto</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	
	<script type="text/javascript">		
		function onlyNumbers(e) {
			if ((e.keyCode < 48) ||
				(e.keyCode > 57)) {
				return false;
			}
			return true;
		}
		
		function find() {
			document.getElementById("newAction").value = "find";
			document.getElementById("form").submit();
		}
		
		function clean() {
			document.getElementById("newAction").value = "clean";
			document.getElementById("form").submit();
		}
		
		function goNew() {
			document.getElementById("newAction").value = "goNew";
			document.getElementById("form").submit();
		}
		
		function detail(id) {
			document.getElementById("newAction").value = "detail";
			document.getElementById("id").value = id;
			document.getElementById("form").submit();
		}
		
		function removeGrid(id) {
			if (confirm("Deseja Apagar o Registro?")) {
				document.getElementById("newAction").value = "remove";
				document.getElementById("id").value = id;
				document.getElementById("form").submit(); 
			}
		}
	</script>	
</head>
<body>
	<div class="divtitulopagina">Consultar Produto</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Produto">
			<input type="hidden" name="id" id="id">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(produtoFilter.getIdProduto() != null) ? produtoFilter.getIdProduto() : ""%>" type="text" name="idProduto" id="idProduto" style="width:50px;" onkeypress="return onlyNumbers(event);" maxlength="9">
			</div>
			<div class="label">Descricao:</div>
			<div class="field">
				<input value="<%=(produtoFilter.getDescricao() != null) ? produtoFilter.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="divbotoes">
				<input type="button" value="Consultar" onclick="find();">
				<input type="button" value="Limpar" onclick="clean();">
				<input type="button" value="Novo" onclick="goNew();">
			</div>
		</form>
	</fieldset>
	<fieldset class="fieldset">
		<table class="tabelatitulo">
			<tr>
				<th style="width:60px;">Código</th>
				<th>Descrição</th>
				<th style="width:100px;">Valor</th>
				<th style="width:100px;">Quantidade</th>
			
				<th style="width:43px">Op</th>
			</tr>
		</table>
		<div class="divtabela">
			<table class="tabelaconteudo">
<%
	for(int i=0; i<listProduto.length; i++) {
		Produto produto = (Produto) listProduto[i];
%>
				<tr>
					<td style="width:60px;"><%=produto.getIdProduto() %></td>
					<td style="text-align: left;"><%=produto.getDescricao() %></td>
					<td style="width:100px;"><%=produto.getValor() %></td>
					<td style="width:100px;"><%=produto.getQuantidade() %></td>
					<td class="tabelacolunaacao" onclick="detail('<%=produto.getIdProduto() %>');"><img src="./img/detail.gif" /></td>
					<td class="tabelacolunaacao" onclick="removeGrid('<%=produto.getIdProduto() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
	}
%>
			</table>
		</div>
	</fieldset>
</body>
</html>