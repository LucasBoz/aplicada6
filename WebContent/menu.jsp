<script type='text/javascript'>

	function execute(entityName, newAction) {
		document.getElementById('newAction').value = newAction;
		document.getElementById('entityName').value = entityName;
		document.getElementById('form').submit();
	}
	
	function doLogout() {
		document.getElementById('form').target = "";
		execute('Usuario','logout')
	}
</script>

<form name="form" id="form" action="./dispatcher" method="post" target="main">
	<input type="hidden" name="newAction" id="newAction">
	<input type="hidden" name="entityName" id="entityName">
</form>

<div>
	MENU
</div>
<div>
	<a href="javascript:execute('Marca','goFind');">Marca</a>
</div>
<div>
	<a href="javascript:execute('Modelo','goFind');">Modelo</a>
</div>
<div>
	<a href="javascript:execute('Cliente','goFind');">Cliente</a>
</div>
<div>
	<a href="javascript:execute('Fornecedor','goFind');">Fornecedor</a>
</div>
<div>
	<a href="javascript:execute('Servico','goFind');">Serviço</a>
</div>
<div>
	<a href="javascript:execute('Produto','goFind');">Produto</a>
</div>
<div>
	<a href="javascript:execute('Veiculo','goFind');">Veiculo</a>
</div>
<div>
	<a href="javascript:execute('Venda','goFind');">Venda</a>
</div>
<div style="background: pink;">
	<a href="javascript:doLogout();">Sair</a>
</div>