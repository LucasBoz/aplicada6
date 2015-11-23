package br.edu.udc.aplicada6.controller;

import br.edu.udc.aplicada6.entity.Marca;
import br.edu.udc.aplicada6.entity.Venda;
import br.edu.udc.aplicada6.session.SessionMarca;
import br.edu.udc.aplicada6.session.SessionVenda;


public class ControllerVenda extends Controller {

	public ControllerVenda() throws Exception {
		super("Venda");
	}

	@Override
	public void goNew() throws Exception {
		try {
			SessionVenda sessionVenda = new SessionVenda();
			request.setAttribute("listVenda",sessionVenda.find(new Venda()));
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./venda/manterVenda.jsp");
	}

	@Override
	public void goFind() throws Exception {
		try {
			SessionVenda sessionVenda = new SessionVenda();
			request.setAttribute("listVenda",sessionVenda.find(new Venda()));
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