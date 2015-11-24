<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionFornecedor" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionCompra" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionVeiculo" %>
<%@ page import="br.edu.udc.aplicada6.entity.Fornecedor" %>
<%@ page import="br.edu.udc.aplicada6.entity.Compra" %>
<%@ page import="br.edu.udc.aplicada6.entity.Veiculo" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	Compra Compra = (Compra) request.getAttribute("object");
	if (Compra == null) {
		Compra = new Compra();
	}
	
	Object listFornecedor[] = (Object[]) request.getAttribute("listFornecedor");
	if (listFornecedor == null) {
		listFornecedor = new Object[0];
	}
	
	Object listVeiculo[] = (Object[]) request.getAttribute("listVeiculo");
	if (listVeiculo == null) {
		listVeiculo = new Object[0];
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Manter Compra</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	
	<script type="text/javascript">		
		function validateFields() {
			if (document.getElementById("descricao").value == "") {
				alert("Descrição é obrigatória!");
				document.getElementById("descricao").focus();
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
	<div class="divtitulopagina">Manter Compra</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Compra">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(Compra.getIdCompra() != null) ? Compra.getIdCompra() : ""%>" type="text" name="idCompra" id="idCompra" style="width:50px;" readOnly maxlength="9">
			</div>
			<div class="label">Quantidade:</div>
			<div class="field">
				<input value="<%=(Compra.getDescricao() != null) ? Compra.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(Compra.getValor() != null) ? Compra.getValor() : ""%>" type="text" name="valor" id="valor" style="width:150px;" maxlength="100">
			</div>
			
			<div class="label">Fornecedor:</div>
			<div class="field">
				<select name="Fornecedor" id="Fornecedor" style="width:150px;">
					<option value=""></option>
					
		
<%
	for(int i=0; i<listFornecedor.length; i++) {
		Fornecedor FornecedorAux = (Fornecedor) listFornecedor[i];
		Boolean bSelected = false;
		if ((Compra.getFornecedor() != null) && 
			(Compra.getFornecedor().getIdFornecedor() == FornecedorAux.getIdFornecedor())) {
			bSelected = true;
		}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=FornecedorAux.getIdFornecedor()%>"><%=FornecedorAux.getIdFornecedor()%></option>	
<%
	}
%>
				</select>
			</div>
			
			
<!-- 			<div class="label">Placa:</div> -->
<!-- 			<div class="field"> -->
<%-- 				<input value="<%=(veiculo.getPlaca() != null) ? veiculo.getPlaca() : ""%>" type="text" name="placa" id="placa" style="width:400px;" maxlength="100"> --%>
<!-- 			</div> -->
<!-- 			<div class="label">Chassi:</div> -->
<!-- 			<div class="field"> -->
<%-- 				<input value="<%=(veiculo.getChassi() != null) ? veiculo.getChassi() : ""%>" type="text" name="chassi" id="chassi" style="width:400px;" maxlength="100"> --%>
<!-- 			</div> -->

<!-- 						<div class="label">Fornecedor:</div> -->
<!-- 			<div class="field"> -->
<!-- 				<select name="Fornecedor" id="Fornecedor" style="width:150px;"> -->
<!-- 					<option value=""></option> -->
<%
// 	for(int i=0; i<listFornecedor.length; i++) {
// 		Fornecedor FornecedorAux = (Fornecedor) listFornecedor[i];
// 		Boolean bSelected = false;
// 		if ((veiculo.getFornecedor() != null) && 
// 			(veiculo.getFornecedor().getIdFornecedor() == FornecedorAux.getIdFornecedor())) {
// 			bSelected = true;
// 		}
%>
<%-- 					<option <%=(bSelected) ? "selected" : "" %> value="<%=FornecedorAux.getIdFornecedor() %>"><%=FornecedorAux.getIdFornecedor() %></option>	 --%>
<%
// 	}
%>
<!-- 				</select> -->
<!-- 			</div> -->
			<div class="divbotoes">
				<input type="button" value="Salvar" onclick="save();">
				<input type="button" value="Excluir" onclick="removeObject();">
				<input type="button" value="Limpar" onclick="clean();">
				<input type="button" value="Voltar" onclick="goFind();">
			</div>
		</form>
	</fieldset>
</body>
</html>