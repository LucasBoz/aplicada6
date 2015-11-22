package br.edu.udc.aplicada6.controller;

import br.edu.udc.aplicada6.entity.Marca;
import br.edu.udc.aplicada6.session.SessionMarca;


public class ControllerModelo extends Controller {

	public ControllerModelo() throws Exception {
		super("Modelo");
	}

	@Override
	public void goNew() throws Exception {
		try {
			SessionMarca sessionMarca = new SessionMarca();
			request.setAttribute("listMarca",sessionMarca.find(new Marca()));
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./modelo/manterModelo.jsp");
	}

	@Override
	public void goFind() throws Exception {
		try {
			SessionMarca sessionMarca = new SessionMarca();
			request.setAttribute("listMarca",sessionMarca.find(new Marca()));
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./modelo/consultarModelo.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","Modelo salvo com sucesso!");
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