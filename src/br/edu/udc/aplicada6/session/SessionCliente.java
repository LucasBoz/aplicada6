package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.DaoCliente;

public class SessionCliente extends Session{

	public SessionCliente() throws Exception{
		super(new DaoCliente());
	}
	
}
