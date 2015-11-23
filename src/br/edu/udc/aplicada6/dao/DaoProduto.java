package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoProduto extends Dao {
	
	public DaoProduto() throws Exception {
		super();
	}
	
	public DaoProduto(Connection connection) throws Exception {
		super(connection);
	}
	
}