<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema Aplicada 6</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	<script type="text/javascript" src="./css/jquery.js"></script>
	<script type="text/javascript">		
		function doLogin() {
			document.getElementById("newAction").value = "login";
			document.getElementById("form").submit();
		}
	</script>	
</head>
<body>
	<div class="divtitulopagina">Login</div>
	<fieldset class="fieldset">
		<form action="./dispatcher" method="post" name="form" id="form">
			<input type="hidden" name="newAction" id="newAction">
			<input type="hidden" name="entityName" id="entityName" value="Usuario">
			<div class="label">Login:</div>
			<div class="field">
				<input type="text" name="login" id="login" style="width:200px;" maxlength="100">
			</div>
			<div class="label">Senha:</div>
			<div class="field">
				<input type="password" name="senha" id="senha" style="width:200px;" maxlength="100">
			</div>
			<div class="divbotoes">
				<input type="button" value="Acessar" onclick="doLogin();">
			</div>
		</form>
	</fieldset>
</body>
</html>