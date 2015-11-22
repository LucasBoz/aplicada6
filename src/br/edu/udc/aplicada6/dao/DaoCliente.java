package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoCliente extends Dao{
	public DaoCliente() throws Exception {
		super();
	}
	
	public DaoCliente(Connection connection) throws Exception {
		super(connection);
	}
}
