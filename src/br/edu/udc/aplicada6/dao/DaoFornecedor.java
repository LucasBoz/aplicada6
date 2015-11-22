package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoFornecedor extends Dao{

	public DaoFornecedor() throws Exception {
		super();
	}
	
	public DaoFornecedor(Connection connection) throws Exception  {
		super(connection);
	}
	
}
