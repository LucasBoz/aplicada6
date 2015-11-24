package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoCompra extends Dao {
	
	public DaoCompra() throws Exception {
		super();
	}
	
	public DaoCompra(Connection connection) throws Exception {
		super(connection);
	}
	
}