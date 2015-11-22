package br.edu.udc.aplicada6.dao;

import java.sql.Connection;

public class DaoVeiculo extends Dao{

	public DaoVeiculo() throws Exception {
		super();
	}

	public DaoVeiculo(Connection connection) throws Exception {
		super(connection);
	}
	
}
