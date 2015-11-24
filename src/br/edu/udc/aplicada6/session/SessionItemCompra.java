package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.Dao;
import br.edu.udc.aplicada6.dao.DaoCompra;
import br.edu.udc.aplicada6.dao.DaoProduto;
import br.edu.udc.aplicada6.dao.DaoItemCompra;
import br.edu.udc.aplicada6.entity.Compra;
import br.edu.udc.aplicada6.entity.Produto;
import br.edu.udc.aplicada6.entity.ItemCompra;

public class SessionItemCompra extends Session{

	public SessionItemCompra() throws Exception{
		super(new DaoItemCompra());
	}
	@Override
	public Object[] find(Object obj) throws Exception {
		Object listItemCompra[] = super.find(obj);
		
		Dao daoProduto = new DaoProduto(this.dao.getConnection());
		Dao daoCompra = new DaoCompra(this.dao.getConnection());
		for (int i = 0; i < listItemCompra.length; i++) {
			ItemCompra ItemCompra = (ItemCompra) listItemCompra[i];
			
			Produto Produto = (Produto) daoProduto.findByPrimaryKey(ItemCompra.getProduto());
			ItemCompra.setProduto(Produto);
			
			Compra Compra = (Compra) daoCompra.findByPrimaryKey(ItemCompra.getCompra());
			ItemCompra.setCompra(Compra);
		}
		return listItemCompra;
	}
}

