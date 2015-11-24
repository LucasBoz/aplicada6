package br.edu.udc.aplicada6.controller;

import br.edu.udc.aplicada6.entity.Cliente;
import br.edu.udc.aplicada6.entity.Veiculo;
import br.edu.udc.aplicada6.entity.Venda;
import br.edu.udc.aplicada6.session.SessionCliente;
import br.edu.udc.aplicada6.session.SessionVeiculo;
import br.edu.udc.aplicada6.session.SessionVenda;



public class ControllerVenda extends Controller {

	public ControllerVenda() throws Exception {
		super("Venda");
	}

	@Override
	public void goNew() throws Exception {
		try {
			SessionCliente sessionCliente = new SessionCliente();
			SessionVeiculo sessionVeiculo = new SessionVeiculo();
			
			request.setAttribute("listCliente",sessionCliente.find(new Cliente()));
			request.setAttribute("listVeiculo",sessionVeiculo.find(new Veiculo()));
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./venda/manterVenda.jsp");
	}

	@Override
	public void goFind() throws Exception {
		try {
			SessionVeiculo sessionVeiculo = new SessionVeiculo();
			SessionCliente sessionCliente = new SessionCliente();
			request.setAttribute("listVeiculo",sessionVeiculo.find(new Veiculo()));
			request.setAttribute("listCliente",sessionCliente.find(new Cliente()));
			
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./venda/consultarVenda.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","Venda salvo com sucesso!");
		this.goNew();
	}

	@Override
	public void remove(Object obj) throws Exception {
		this.goFind();
	}

	@Override
	public void detail(Object obj) throws Exception {
		request.setAttribute("object",obj);
		this.goNew();
	}
	
	@Override
	public void find(Object obj) throws Exception {
		request.setAttribute("list",obj);
		this.goFind();
	}
}