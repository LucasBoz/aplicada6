package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.Dao;
import br.edu.udc.aplicada6.dao.DaoMarca;
import br.edu.udc.aplicada6.dao.DaoModelo;
import br.edu.udc.aplicada6.entity.Marca;
import br.edu.udc.aplicada6.entity.Modelo;

public class SessionModelo extends Session {

	public SessionModelo() throws Exception {
		super(new DaoModelo());
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object listModelo[] = super.find(obj);
		
		Dao daoMarca = new DaoMarca(this.dao.getConnection());
		
		for (int i = 0; i < listModelo.length; i++) {
			Modelo modelo = (Modelo) listModelo[i];
			
			Marca marca = (Marca) daoMarca.findByPrimaryKey(modelo.getMarca());
			
			modelo.setMarca(marca);
		}
		return listModelo;
	}
}