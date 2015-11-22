<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionFornecedor" %>
<%@ page import="br.edu.udc.aplicada6.entity.Fornecedor" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	Fornecedor fornecedor = (Fornecedor) request.getAttribute("object");
	if (fornecedor == null) {
		fornecedor = new Fornecedor();
	}	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Manter Fornecedor</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	
	<script type="text/javascript">		
		function validateFields() {
			if (document.getElementById("razaoSocial").value == "") {
				alert("Descrição é obrigatória!");
				document.getElementById("descricao").focus();
				return false;
			}
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
	<div class="divtitulopagina">Manter Fornecedor</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Fornecedor">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(fornecedor.getIdFornecedor() != null) ? fornecedor.getIdFornecedor() : ""%>" type="text" name="idFornecedor" id="idFornecedor" style="width:50px;" readOnly maxlength="9">
			</div>
			<div class="label">Razão Social:</div>
			<div class="field">
				<input value="<%=(fornecedor.getRazaoSocial() != null) ? fornecedor.getRazaoSocial() : ""%>" type="text" name="razaoSocial" id="razaoSocial" style="width:400px;" maxlength="100">
			</div>
			<div class="label">CNPJ:</div>
			<div class="field">
				<input value="<%=(fornecedor.getCnpj() != null) ? fornecedor.getCnpj() : ""%>" type="text" name="cnpj" id="cnpj" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Logradouro:</div>
			<div class="field">
				<input value="<%=(fornecedor.getLogradouro() != null) ? fornecedor.getLogradouro() : ""%>" type="text" name="logradouro" id="logradouro" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Numero:</div>
			<div class="field">
				<input value="<%=(fornecedor.getNumero() != null) ? fornecedor.getNumero() : ""%>" type="text" name="numero" id="numero" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Bairro:</div>
			<div class="field">
				<input value="<%=(fornecedor.getBairro() != null) ? fornecedor.getBairro() : ""%>" type="text" name="bairro" id="bairro" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Cidade:</div>
			<div class="field">
				<input value="<%=(fornecedor.getCidade() != null) ? fornecedor.getCidade() : ""%>" type="text" name="cidade" id="cidade" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Estado:</div>
			<div class="field">
				<input value="<%=(fornecedor.getEstado() != null) ? fornecedor.getEstado() : ""%>" type="text" name="estado" id="estado" style="width:400px;" maxlength="100">
			</div>
			<div class="label">CEP:</div>
			<div class="field">
				<input value="<%=(fornecedor.getCep() != null) ? fornecedor.getCep() : ""%>" type="text" name="cep" id="cep" style="width:400px;" maxlength="100">
			</div>
			<div class="divbotoes">
				<input type="button" value="Salvar" onclick="save();">
				<input type="button" value="Excluir" onclick="remove();">
				<input type="button" value="Limpar" onclick="clean();">
				<input type="button" value="Voltar" onclick="goFind();">
			</div>
		</form>
	</fieldset>
</body>
</html>