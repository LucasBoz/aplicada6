package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.DaoProduto;

public class SessionProduto extends Session {

	public SessionProduto() throws Exception {
		super(new DaoProduto());
	}

}