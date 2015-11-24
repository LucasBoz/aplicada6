<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionVenda" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionCliente" %>
<%@ page import="br.edu.udc.aplicada6.entity.Venda" %>
<%@ page import="br.edu.udc.aplicada6.entity.Cliente" %>
<%
	Venda vendaFilter = (Venda) request.getSession().getAttribute("filterVenda");
	if (vendaFilter == null) {
		vendaFilter = new Venda();
	}
	Object listVenda[] = (Object[]) request.getAttribute("list");
	if (listVenda == null) {
		listVenda = new Object[0];
	}
	
	Object listCliente[] = (Object[]) request.getAttribute("listCliente");
	if (listCliente == null) {
		listCliente = new Object[0];
	}
/* 	
	Object listModelo[] = (Object[]) request.getAttribute("listModelo");
	if (listModelo == null) {
		listModelo = new Object[0];
	}
	
	Object listCliente[] = (Object[]) request.getAttribute("listCliente");
	if (listCliente == null) {
		listCliente = new Object[0];
	} */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Consultar Venda</title>
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
		function additens(id) {
			document.getElementById("entityName").value = "ItemVenda"
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
	<div class="divtitulopagina">Consultar Venda</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="id" id="id">
			<input type="hidden" name="entityName" id="entityName" value="Venda">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(vendaFilter.getIdVenda() != null) ? vendaFilter.getIdVenda() : ""%>" type="text" name="idVenda" id="idVenda" style="width:50px;" onkeypress="return onlyNumbers(event);" maxlength="9">
			</div>
			<div class="label">Descricao:</div>
			<div class="field">
				<input value="<%=(vendaFilter.getDescricao() != null) ? vendaFilter.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(vendaFilter.getValor() != null) ? vendaFilter.getValor() : ""%>" type="text" name="valor" id="valor" style="width:400px;" maxlength="100">
			</div>

<%-- 			<div class="label">Chassi:</div>
			<div class="field">
				<input value="<%=(vendaFilter.getChassi() != null) ? vendaFilter.getChassi() : ""%>" type="text" name="chassi" id="chassi" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Modelo:</div>
			<div class="field">
				<select name="modelo" id="modelo" style="width:150px;">
					<option value=""></option>
<%
	for(int i=0; i<listModelo.length; i++) {
		Modelo marcaAux = (Modelo) listModelo[i];
		Boolean bSelected = false;
		if ((veiculoFilter.getModelo() != null) && 
			(veiculoFilter.getModelo().getIdModelo() == marcaAux.getIdModelo())) {
			bSelected = true;
		}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=marcaAux.getIdModelo() %>"><%=marcaAux.getDescricao() %></option>	
<%
	}
%>
				</select>
			</div>
						<div class="label">Cliente:</div>
			<div class="field">
				<select name="cliente" id="cliente" style="width:150px;">
					<option value=""></option>
<%
	for(int i=0; i<listCliente.length; i++) {
		Cliente clienteAux = (Cliente) listCliente[i];
		Boolean bSelected = false;
		if ((veiculoFilter.getCliente() != null) && 
			(veiculoFilter.getCliente().getIdCliente() == clienteAux.getIdCliente())) {
			bSelected = true;
		}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=clienteAux.getIdCliente() %>"><%=clienteAux.getIdCliente() %></option>	
<%
	}
%>
				</select>
			</div> --%>
									<div class="label">Cliente:</div>
			<div class="field">
				<select name="cliente" id="cliente" style="width:150px;">
					<option value=""></option>
<%
	for(int i=0; i<listCliente.length; i++) {
		Cliente clienteAux = (Cliente) listCliente[i];
		Boolean bSelected = false;
		if ((vendaFilter.getCliente() != null) && 
			(vendaFilter.getCliente().getIdCliente() == clienteAux.getIdCliente())) {
			bSelected = true;
		}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=clienteAux.getIdCliente() %>"><%=clienteAux.getIdCliente() %></option>	
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
<!-- 				<th>chassi</th> -->
<!-- 				<th>modelo</th> -->
<!-- 				<th>cliente</th> -->
			</tr>
		</table>
		<div class="divtabela">
			<table class="tabelaconteudo">
<%
	for(int i=0; i<listVenda.length; i++) {
		Venda venda = (Venda) listVenda[i];
%>
				<tr>
					<td style="width:60px;"><%=venda.getIdVenda() %></td>
					<td style="text-align: left; width:450px;"><%=venda.getDescricao() %></td>
<%-- 					<td style="text-align: left;"><%=veiculo.getChassi() %></td> --%>
<%-- 					<td style="text-align: left;"><%=veiculo.getModelo().getDescricao() %></td> --%>
<%-- 					<td style="text-align: left;"><%=veiculo.getCliente().getNome() %></td> --%>
					<td class="tabelacolunaacao" onclick="additens('<%=venda.getIdVenda() %>');">Add Produtos</td>
					<td class="tabelacolunaacao" onclick="detail('<%=venda.getIdVenda() %>');"><img src="./img/detail.gif" /></td>
					<td class="tabelacolunaacao" onclick="removeGrid('<%=venda.getIdVenda() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
	}
%>
			</table>
		</div>
	</fieldset>
</body>
</html>