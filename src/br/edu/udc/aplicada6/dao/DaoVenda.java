package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoVenda extends Dao {
	
	public DaoVenda() throws Exception {
		super();
	}
	
	public DaoVenda(Connection connection) throws Exception {
		super(connection);
	}
	
}