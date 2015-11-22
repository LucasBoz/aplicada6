package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.DaoMarca;

public class SessionMarca extends Session {

	public SessionMarca() throws Exception {
		super(new DaoMarca());
	}

}