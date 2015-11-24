<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionFornecedor" %>
<%@ page import="br.edu.udc.aplicada6.entity.Fornecedor" %>
<%
	Fornecedor fornecedorFilter = (Fornecedor) request.getSession().getAttribute("filterFornecedor");
	if (fornecedorFilter == null) {
		fornecedorFilter = new Fornecedor();
	}
	Object listFornecedor[] = (Object[]) request.getAttribute("list");
	if (listFornecedor == null) {
		listFornecedor = new Object[0];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Consultar Fornecedor</title>
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
	<div class="divtitulopagina">Consultar Fornecedor</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Fornecedor">
			<input type="hidden" name="id" id="id">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(fornecedorFilter.getIdFornecedor() != null) ? fornecedorFilter.getIdFornecedor() : ""%>" type="text" name="idFornecedor" id="idFornecedor" style="width:50px;" onkeypress="return onlyNumbers(event);" maxlength="9">
			</div>
			<div class="label">RazaoSocial:</div>
			<div class="field">
				<input value="<%=(fornecedorFilter.getRazaoSocial() != null) ? fornecedorFilter.getRazaoSocial() : ""%>" type="text" name="razaoSocial" id="razaoSocial" style="width:400px;" maxlength="100">
			</div>
			<div class="label">CNPJ:</div>
			<div class="field">
				<input value="<%=(fornecedorFilter.getCnpj() != null) ? fornecedorFilter.getCnpj() : ""%>" type="text" name="cnpj" id="cnpj" style="width:400px;" maxlength="100">
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
				<th style="width:428px;">Razão Social</th>
				<th style="width:231px;">CNPJ</th>
				<th style="width:43px;">Op</th>
			</tr>
		</table>
		<div class="divtabela">
			<table class="tabelaconteudo">
<%
	for(int i=0; i<listFornecedor.length; i++) {
		Fornecedor fornecedor = (Fornecedor) listFornecedor[i];
%>
				<tr>
					<td style="width:60px;"><%=fornecedor.getIdFornecedor() %></td>
					<td style="text-align: left;"><%=fornecedor.getRazaoSocial() %></td>
					<td style="text-align: left; width:231px;"><%=fornecedor.getCnpj()%></td>
					<td class="tabelacolunaacao" onclick="detail('<%=fornecedor.getIdFornecedor() %>');"><img src="./img/detail.gif" /></td>
					<td class="tabelacolunaacao" onclick="removeGrid('<%=fornecedor.getIdFornecedor() %>');"><img src="./img/remove.gif" /></td>
				</tr>
<%
	}
%>
			</table>
		</div>
	</fieldset>
</body>
</html>