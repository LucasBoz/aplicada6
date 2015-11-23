<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionProduto" %>
<%@ page import="br.edu.udc.aplicada6.entity.Produto" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	Produto produto = (Produto) request.getAttribute("object");
	if (produto == null) {
		produto = new Produto();
	}	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Manter Produto</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	
	<script type="text/javascript">		
		function validateFields() {
			if (document.getElementById("descricao").value == "") {
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
	<div class="divtitulopagina">Manter Produto</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Produto">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(produto.getIdProduto() != null) ? produto.getIdProduto() : ""%>" type="text" name="idProduto" id="idProduto" style="width:50px;" readOnly maxlength="9">
			</div>
			<div class="label">Descricao:</div>
			<div class="field">
				<input value="<%=(produto.getDescricao() != null) ? produto.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(produto.getValor() != null) ? produto.getValor() : ""%>" type="number" step="0.01"name="valor" id="valor" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Quantidade:</div>
			<div class="field">
				<input value="<%=(produto.getQuantidade() != null) ? produto.getQuantidade() : ""%>" type="number"fnname="quantidade" id="quantidade" style="width:400px;" maxlength="100">
			</div>
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