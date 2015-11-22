<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionMarca" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionModelo" %>
<%@ page import="br.edu.udc.aplicada6.entity.Marca" %>
<%@ page import="br.edu.udc.aplicada6.entity.Modelo" %>
<%
	Modelo modeloFilter = (Modelo) request.getSession().getAttribute("filterModelo");
	if (modeloFilter == null) {
		modeloFilter = new Modelo();
	}
	Object listModelo[] = (Object[]) request.getAttribute("list");
	if (listModelo == null) {
		listModelo = new Object[0];
	}
	
	Object listMarca[] = (Object[]) request.getAttribute("listMarca");
	if (listMarca == null) {
		listMarca = new Object[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Consultar Modelo</title>
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
	<div class="divtitulopagina">Consultar Modelo</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="id" id="id">
			<input type="hidden" name="entityName" id="entityName" value="Modelo">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(modeloFilter.getIdModelo() != null) ? modeloFilter.getIdModelo() : ""%>" type="text" name="idModelo" id="idModelo" style="width:50px;" onkeypress="return onlyNumbers(event);" maxlength="9">
			</div>
			<div class="label">Descricao:</div>
			<div class="field">
				<input value="<%=(modeloFilter.getDescricao() != null) ? modeloFilter.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Marca:</div>
			<div class="field">
				<select name="marca" id="marca" style="width:150px;">
					<option value=""></option>
<%
	for(int i=0; i<listMarca.length; i++) {
		Marca marcaAux = (Marca) listMarca[i];
		Boolean bSelected = false;
		if ((modeloFilter.getMarca() != null) && 
			(modeloFilter.getMarca().getIdMarca() == marcaAux.getIdMarca())) {
			bSelected = true;
		}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=marcaAux.getIdMarca() %>"><%=marcaAux.getDescricao() %></option>	
<%
	}
%>
				</select>
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
				<th style="width:450px;">Descrição</th>
				<th>Marca</th>
			</tr>
		</table>
		<div class="divtabela">
			<table class="tabelaconteudo">
<%
	for(int i=0; i<listModelo.length; i++) {
		Modelo modelo = (Modelo) listModelo[i];
%>
				<tr>
					<td style="width:60px;"><%=modelo.getIdModelo() %></td>
					<td style="text-align: left; width:450px;"><%=modelo.getDescricao() %></td>
					<td style="text-align: left;"><%=modelo.getMarca().getDescricao() %></td>
					<td class="tabelacolunaacao" onclick="detail('<%=modelo.getIdModelo() %>');"><img src="./img/detail.gif" /></td>
					<td class="tabelacolunaacao" onclick="removeGrid('<%=modelo.getIdModelo() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
	}
%>
			</table>
		</div>
	</fieldset>
</body>
</html>