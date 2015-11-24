<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionCompra" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionFornecedor" %>
<%@ page import="br.edu.udc.aplicada6.entity.Compra" %>
<%@ page import="br.edu.udc.aplicada6.entity.Fornecedor" %>
<%
	Compra CompraFilter = (Compra) request.getSession().getAttribute("filterCompra");
	if (CompraFilter == null) {
		CompraFilter = new Compra();
	}
	Object listCompra[] = (Object[]) request.getAttribute("list");
	if (listCompra == null) {
		listCompra = new Object[0];
	}
	
	Object listFornecedor[] = (Object[]) request.getAttribute("listFornecedor");
	if (listFornecedor == null) {
		listFornecedor = new Object[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Consultar Compra</title>
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
			document.getElementById("entityName").value = "ItemCompra"
			document.getElementById("newAction").value = "detail";
			document.getElementById("idcompra").value = id;
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
	<div class="divtitulopagina">Consultar Compra</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="id" id="id">
			<input type="hidden" name="idcompra" id="idcompra">
			<input type="hidden" name="entityName" id="entityName" value="Compra">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(CompraFilter.getIdCompra() != null) ? CompraFilter.getIdCompra() : ""%>" type="text" name="idCompra" id="idCompra" style="width:50px;" onkeypress="return onlyNumbers(event);" maxlength="9">
			</div>
			<div class="label">Descricao:</div>
			<div class="field">
				<input value="<%=(CompraFilter.getDescricao() != null) ? CompraFilter.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(CompraFilter.getValor() != null) ? CompraFilter.getValor() : ""%>" type="text" name="valor" id="valor" style="width:400px;" maxlength="100">
			</div>

<%-- 			<div class="label">Chassi:</div>
			<div class="field">
				<input value="<%=(CompraFilter.getChassi() != null) ? CompraFilter.getChassi() : ""%>" type="text" name="chassi" id="chassi" style="width:400px;" maxlength="100">
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
						<div class="label">Fornecedor:</div>
			<div class="field">
				<select name="Fornecedor" id="Fornecedor" style="width:150px;">
					<option value=""></option>
<%
	for(int i=0; i<listFornecedor.length; i++) {
		Fornecedor FornecedorAux = (Fornecedor) listFornecedor[i];
		Boolean bSelected = false;
		if ((veiculoFilter.getFornecedor() != null) && 
			(veiculoFilter.getFornecedor().getIdFornecedor() == FornecedorAux.getIdFornecedor())) {
			bSelected = true;
		}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=FornecedorAux.getIdFornecedor() %>"><%=FornecedorAux.getIdFornecedor() %></option>	
<%
	}
%>
				</select>
			</div> --%>
									<div class="label">Fornecedor:</div>
			<div class="field">
				<select name="Fornecedor" id="Fornecedor" style="width:150px;">
					<option value=""></option>
<%
	for(int i=0; i<listFornecedor.length; i++) {
		Fornecedor FornecedorAux = (Fornecedor) listFornecedor[i];
		Boolean bSelected = false;
		if ((CompraFilter.getFornecedor() != null) && 
			(CompraFilter.getFornecedor().getIdFornecedor() == FornecedorAux.getIdFornecedor())) {
			bSelected = true;
		}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=FornecedorAux.getIdFornecedor() %>"><%=FornecedorAux.getIdFornecedor() %></option>	
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
<!-- 				<th>Fornecedor</th> -->
			</tr>
		</table>
		<div class="divtabela">
			<table class="tabelaconteudo">
<%
	for(int i=0; i<listCompra.length; i++) {
		Compra Compra = (Compra) listCompra[i];
%>
				<tr>
					<td style="width:60px;"><%=Compra.getIdCompra() %></td>
					<td style="text-align: left; width:450px;"><%=Compra.getDescricao() %></td>
<%-- 					<td style="text-align: left;"><%=veiculo.getChassi() %></td> --%>
<%-- 					<td style="text-align: left;"><%=veiculo.getModelo().getDescricao() %></td> --%>
<%-- 					<td style="text-align: left;"><%=veiculo.getFornecedor().getNome() %></td> --%>

					<td class="tabelacolunaacao" onclick="additens('<%=Compra.getIdCompra() %>');">Add Produto</td>
					<td class="tabelacolunaacao" onclick="detail('<%=Compra.getIdCompra() %>');"><img src="./img/detail.gif" /></td>
					<td class="tabelacolunaacao" onclick="removeGrid('<%=Compra.getIdCompra() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
	}
%>
			</table>
		</div>
	</fieldset>
</body>
</html>