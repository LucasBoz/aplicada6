package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoItemVenda extends Dao {
	
	public DaoItemVenda() throws Exception {
		super();
	}
	
	public DaoItemVenda(Connection connection) throws Exception {
		super(connection);
	}
	
}