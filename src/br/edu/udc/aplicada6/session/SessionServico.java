package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.DaoServico;


public class SessionServico extends Session {

	public SessionServico() throws Exception {
		super(new DaoServico());
	}

}