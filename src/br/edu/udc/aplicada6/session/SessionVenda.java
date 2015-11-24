package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.Dao;
import br.edu.udc.aplicada6.dao.DaoCliente;
import br.edu.udc.aplicada6.dao.DaoVeiculo;
import br.edu.udc.aplicada6.dao.DaoVenda;
import br.edu.udc.aplicada6.entity.Cliente;
import br.edu.udc.aplicada6.entity.Veiculo;
import br.edu.udc.aplicada6.entity.Venda;

public class SessionVenda extends Session{

	public SessionVenda() throws Exception{
		super(new DaoVenda());
	}
	@Override
	public Object[] find(Object obj) throws Exception {
		Object listVenda[] = super.find(obj);
		
		Dao daoVeiculo = new DaoVeiculo(this.dao.getConnection());
		Dao daoCliente = new DaoCliente(this.dao.getConnection());
		
		
		
		for (int i = 0; i < listVenda.length; i++) {
			Venda venda = (Venda) listVenda[i];
			
			Veiculo veiculo = (Veiculo) daoVeiculo.findByPrimaryKey(venda.getVeiculo());
			venda.setVeiculo(veiculo);
			
			Cliente cliente = (Cliente) daoCliente.findByPrimaryKey(venda.getCliente());
			venda.setCliente(cliente);
			
		}
		return listVenda;
	}
}

