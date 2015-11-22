package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoMarca extends Dao {
	
	public DaoMarca() throws Exception {
		super();
	}
	
	public DaoMarca(Connection connection) throws Exception {
		super(connection);
	}
	
}