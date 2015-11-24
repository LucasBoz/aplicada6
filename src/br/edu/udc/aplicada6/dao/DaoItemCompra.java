package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoItemCompra extends Dao {
	
	public DaoItemCompra() throws Exception {
		super();
	}
	
	public DaoItemCompra(Connection connection) throws Exception {
		super(connection);
	}
	
}