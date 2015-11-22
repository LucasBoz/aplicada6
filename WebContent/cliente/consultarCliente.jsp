<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionCliente" %>
<%@ page import="br.edu.udc.aplicada6.entity.Cliente" %>
<%
	Cliente clienteFilter = (Cliente) request.getSession().getAttribute("filterCliente");
	if (clienteFilter == null) {
		clienteFilter = new Cliente();
	}
	Object listCliente[] = (Object[]) request.getAttribute("list");
	if (listCliente == null) {
		listCliente = new Object[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Consultar Cliente</title>
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
	<div class="divtitulopagina">Consultar Cliente</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Cliente">
			<input type="hidden" name="id" id="id">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(clienteFilter.getIdCliente() != null) ? clienteFilter.getIdCliente() : ""%>" type="text" name="idCliente" id="idCliente" style="width:50px;" onkeypress="return onlyNumbers(event);" maxlength="9">
			</div>
			<div class="label">Nome:</div>
			<div class="field">
				<input value="<%=(clienteFilter.getNome() != null) ? clienteFilter.getNome() : ""%>" type="text" name="nome" id="nome" style="width:400px;" maxlength="100">
			</div>
			<div class="label">CPF:</div>
			<div class="field">
				<input value="<%=(clienteFilter.getCpf() != null) ? clienteFilter.getCpf() : ""%>" type="text" name="cpf" id="cpf" style="width:400px;" maxlength="100">
			</div>
			<div class="label">RG:</div>
			<div class="field">
				<input value="<%=(clienteFilter.getRg() != null) ? clienteFilter.getRg() : ""%>" type="text" name="rg" id="rg" style="width:400px;" maxlength="100">
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
			</tr>
		</table>
		<div class="divtabela">
			<table class="tabelaconteudo">
<%
	for(int i=0; i<listCliente.length; i++) {
		Cliente cliente = (Cliente) listCliente[i];
%>
				<tr>
					<td style="width:60px;"><%=cliente.getIdCliente() %></td>
					<td style="text-align: left;"><%=cliente.getNome() %></td>
					<td style="text-align: left;"><%=cliente.getCpf() %></td>
					<td style="text-align: left;"><%=cliente.getCep() %></td>
					<td class="tabelacolunaacao" onclick="detail('<%=cliente.getIdCliente() %>');"><img src="./img/detail.gif" /></td>
					<td class="tabelacolunaacao" onclick="removeGrid('<%=cliente.getIdCliente() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
	}
%>
			</table>
		</div>
	</fieldset>
</body>
</html>