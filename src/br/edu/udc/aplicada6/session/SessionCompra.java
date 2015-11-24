package br.edu.udc.aplicada6.session;


import br.edu.udc.aplicada6.entity.Compra;
import br.edu.udc.aplicada6.entity.Fornecedor;
import br.edu.udc.aplicada6.dao.Dao;
import br.edu.udc.aplicada6.dao.DaoCompra;
import br.edu.udc.aplicada6.dao.DaoFornecedor;

public class SessionCompra extends Session{

	public SessionCompra() throws Exception{
		super(new DaoCompra());
		
		
	}
	@Override
	public Object[] find(Object obj) throws Exception {
		Object listCompra[] = super.find(obj);
		Dao daoFornecedor = new DaoFornecedor(this.dao.getConnection());
		for (int i = 0; i < listCompra.length; i++) {
			Compra compra = (Compra) listCompra[i];
			Fornecedor fornecedor = (Fornecedor) daoFornecedor.findByPrimaryKey(compra.getFornecedor());
			compra.setFornecedor(fornecedor);
		}
		return listCompra;
	}
}

