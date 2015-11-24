<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.aplicada6.session.Session" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionCliente" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionVenda" %>
<%@ page import="br.edu.udc.aplicada6.session.SessionVeiculo" %>
<%@ page import="br.edu.udc.aplicada6.entity.Cliente" %>
<%@ page import="br.edu.udc.aplicada6.entity.Venda" %>
<%@ page import="br.edu.udc.aplicada6.entity.Veiculo" %>
<%
	String mensagem = (String) request.getAttribute("msg");
	Venda venda = (Venda) request.getAttribute("object");
	if (venda == null) {
		venda = new Venda();
	}
	
	Object listCliente[] = (Object[]) request.getAttribute("listCliente");
	if (listCliente == null) {
		listCliente = new Object[0];
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
	<title>Manter Venda</title>
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
	<div class="divtitulopagina">Manter Venda</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Venda">
			<div class="label">Código:</div>
			<div class="field">
				<input value="<%=(venda.getIdVenda() != null) ? venda.getIdVenda() : ""%>" type="text" name="idVenda" id="idVenda" style="width:50px;" readOnly maxlength="9">
			</div>
			<div class="label">Descricao:</div>
			<div class="field">
				<input value="<%=(venda.getDescricao() != null) ? venda.getDescricao() : ""%>" type="text" name="descricao" id="descricao" style="width:400px;" maxlength="100">
			</div>
			<div class="label">Valor:</div>
			<div class="field">
				<input value="<%=(venda.getValor() != null) ? venda.getValor() : ""%>" type="text" name="valor" id="valor" style="width:150px;" maxlength="100">
			</div>
			
			<div class="label">Cliente:</div>
			<div class="field">
				<select name="cliente" id="cliente" style="width:150px;">
					<option value=""></option>
					
		
<%
	for(int i=0; i<listCliente.length; i++) {
		Cliente clienteAux = (Cliente) listCliente[i];
		Boolean bSelected = false;
		if ((venda.getCliente() != null) && 
			(venda.getCliente().getIdCliente() == clienteAux.getIdCliente())) {
			bSelected = true;
		}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=clienteAux.getIdCliente()%>"><%=clienteAux.getIdCliente()%></option>	
<%
	}
%>
				</select>
			</div>
			
			
				<div class="label">Veiculo:</div>
			<div class="field">
				<select name="veiculo" id="veiculo" style="width:150px;">
					<option value=""></option>		
			<%
		for(int i=0; i<listVeiculo.length; i++) {
			Veiculo veiculoAux = (Veiculo) listVeiculo[i];
			Boolean bSelected = false;
			if ((venda.getVeiculo() != null) && 
				(venda.getVeiculo().getIdVeiculo() == veiculoAux.getIdVeiculo())) {
				bSelected = true;
			}
%>
					<option <%=(bSelected) ? "selected" : "" %> value="<%=veiculoAux.getIdVeiculo()%>"><%=veiculoAux.getPlaca()%></option>				
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

<!-- 						<div class="label">Cliente:</div> -->
<!-- 			<div class="field"> -->
<!-- 				<select name="cliente" id="cliente" style="width:150px;"> -->
<!-- 					<option value=""></option> -->
<%
// 	for(int i=0; i<listCliente.length; i++) {
// 		Cliente clienteAux = (Cliente) listCliente[i];
// 		Boolean bSelected = false;
// 		if ((veiculo.getCliente() != null) && 
// 			(veiculo.getCliente().getIdCliente() == clienteAux.getIdCliente())) {
// 			bSelected = true;
// 		}
%>
<%-- 					<option <%=(bSelected) ? "selected" : "" %> value="<%=clienteAux.getIdCliente() %>"><%=clienteAux.getIdCliente() %></option>	 --%>
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