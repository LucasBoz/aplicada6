<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionMarca" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionModelo" %>
<%@ page import="br.edu.udc.aplicada6.entity.Marca" %>
<%@ page import="br.edu.udc.aplicada6.entity.Modelo" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	Modelo modelo = (Modelo) request.getAttribute("object");
	if (modelo == null) {
		modelo = new Modelo();
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
	<title>Manter Modelo</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	
	<script type="text/javascript">		
		function validateFields() {
			if (document.getElementById("descricao").value == "") {
				alert("Descrição é obrigatória!");
				document.getElementById("descricao").focus();
				return false;
			}
			
			if (document.getElementById("marca").value == "") {
				alert("Marca é obrigatória!");
				document.getElementById("marca").focus();
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
	<div class="divtitulopagina">Manter Modelo</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Modelo">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(modelo.getIdModelo() != null) ? modelo.getIdModelo() : ""%>" type="text" name="idModelo" id="idModelo" style="width:50px;" readOnly maxlength="9">
			</div>
			<div class="label">Descricao:</div>
			<div class="field">
				<input value="<%=(modelo.getDescricao() != null) ? modelo.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Marca:</div>
			<div class="field">
				<select name="marca" id="marca" style="width:150px;">
					<option value=""></option>
<%
	for(int i=0; i<listMarca.length; i++) {
		Marca marcaAux = (Marca) listMarca[i];
		Boolean bSelected = false;
		if ((modelo.getMarca() != null) && 
			(modelo.getMarca().getIdMarca() == marcaAux.getIdMarca())) {
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
				<input type="button" value="Salvar" onclick="save();">
				<input type="button" value="Excluir" onclick="removeObject();">
				<input type="button" value="Limpar" onclick="clean();">
				<input type="button" value="Voltar" onclick="goFind();">
			</div>
		</form>
	</fieldset>
</body>
</html>