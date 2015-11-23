package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.DaoCliente;
import br.edu.udc.aplicada6.dao.DaoVenda;

public class SessionVenda extends Session{

	public SessionVenda() throws Exception{
		super(new DaoVenda());
	}
	
}
