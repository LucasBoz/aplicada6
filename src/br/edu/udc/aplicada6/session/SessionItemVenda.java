package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.Dao;
import br.edu.udc.aplicada6.dao.DaoVenda;
import br.edu.udc.aplicada6.dao.DaoProduto;
import br.edu.udc.aplicada6.dao.DaoItemVenda;
import br.edu.udc.aplicada6.entity.Venda;
import br.edu.udc.aplicada6.entity.Produto;
import br.edu.udc.aplicada6.entity.ItemVenda;

public class SessionItemVenda extends Session{

	public SessionItemVenda() throws Exception{
		super(new DaoItemVenda());
	}
	@Override
	public Object[] find(Object obj) throws Exception {
		Object listItemVenda[] = super.find(obj);
		
		Dao daoProduto = new DaoProduto(this.dao.getConnection());
		Dao daoVenda = new DaoVenda(this.dao.getConnection());
		for (int i = 0; i < listItemVenda.length; i++) {
			ItemVenda ItemVenda = (ItemVenda) listItemVenda[i];
			
			Produto Produto = (Produto) daoProduto.findByPrimaryKey(ItemVenda.getProduto());
			ItemVenda.setProduto(Produto);
			
			Venda Venda = (Venda) daoVenda.findByPrimaryKey(ItemVenda.getVenda());
			ItemVenda.setVenda(Venda);
		}
		return listItemVenda;
	}
}

