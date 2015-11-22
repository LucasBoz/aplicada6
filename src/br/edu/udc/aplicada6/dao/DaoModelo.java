package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoModelo extends Dao {
	
	public DaoModelo() throws Exception {
		super();
	}
	
	public DaoModelo(Connection connection) throws Exception {
		super(connection);
	}
	
}