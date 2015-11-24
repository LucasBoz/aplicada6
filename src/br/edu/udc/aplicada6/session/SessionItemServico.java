package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.Dao;
import br.edu.udc.aplicada6.dao.DaoServico;
import br.edu.udc.aplicada6.dao.DaoVenda;
import br.edu.udc.aplicada6.dao.DaoProduto;
import br.edu.udc.aplicada6.dao.DaoItemServico;
import br.edu.udc.aplicada6.entity.Servico;
import br.edu.udc.aplicada6.entity.Venda;
import br.edu.udc.aplicada6.entity.Produto;
import br.edu.udc.aplicada6.entity.ItemServico;

public class SessionItemServico extends Session{

	public SessionItemServico() throws Exception{
		super(new DaoItemServico());
	}
	@Override
	public Object[] find(Object obj) throws Exception {
		Object listItemServico[] = super.find(obj);
		
		Dao daoProduto = new DaoProduto(this.dao.getConnection());
		Dao daoServico = new DaoServico(this.dao.getConnection());
		
		Dao daoVenda = new DaoVenda(this.dao.getConnection());
		for (int i = 0; i < listItemServico.length; i++) {
			ItemServico ItemServico = (ItemServico) listItemServico[i];
			
			Produto Produto = (Produto) daoProduto.findByPrimaryKey(ItemServico.getProduto());
			ItemServico.setProduto(Produto);
			
			Servico Servico = (Servico) daoServico.findByPrimaryKey(ItemServico.getServico());
			ItemServico.setServico(Servico);
			
			Venda Venda = (Venda) daoVenda.findByPrimaryKey(ItemServico.getVenda());
			ItemServico.setVenda(Venda);
		}
		return listItemServico;
	}
}

