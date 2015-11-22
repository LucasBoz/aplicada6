package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.DaoVeiculo;

public class SessionVeiculo extends Session{

	public SessionVeiculo() throws Exception {
		super(new DaoVeiculo());
	}
	
}
