<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionServico" %>
<%@ page import="br.edu.udc.aplicada6.entity.Servico" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	Servico servico = (Servico) request.getAttribute("object");
	if (servico == null) {
		servico = new Servico();
	}	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Manter Servico</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	
	<script type="text/javascript">		
		function validateFields() {
			if (document.getElementById("descricao").value == "") {
				alert("Descri��o � obrigat�ria!");
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
	<div class="divtitulopagina">Manter Servico</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Servico">
			<div class="label">C�digo:</div>
			<div class="field">
				<input value="<%=(servico.getIdServico() != null) ? servico.getIdServico() : ""%>" type="text" name="idServico" id="idServico" style="width:50px;" readOnly maxlength="9">
			</div>
			<div class="label">Descricao:</div>
			<div class="field">
				<input value="<%=(servico.getDescricao() != null) ? servico.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(servico.getValor() != null) ? servico.getValor() : ""%>" type="number" name="valor" id="valor" style="width:400px;" maxlength="100">
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