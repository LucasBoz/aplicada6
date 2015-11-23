package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoServico extends Dao {
	
	public DaoServico() throws Exception {
		super();
	}
	
	public DaoServico(Connection connection) throws Exception {
		super(connection);
	}
	
}