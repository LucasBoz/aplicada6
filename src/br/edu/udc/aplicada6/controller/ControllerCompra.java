package br.edu.udc.aplicada6.controller;

import br.edu.udc.aplicada6.entity.Cliente;
import br.edu.udc.aplicada6.entity.Fornecedor;
import br.edu.udc.aplicada6.session.SessionFornecedor;



public class ControllerCompra extends Controller {

	public ControllerCompra() throws Exception {
		super("Compra");
	}

	@Override
	public void goNew() throws Exception {
		try {

			SessionFornecedor sessionFornecedor = new SessionFornecedor();
			request.setAttribute("listFornecedor",sessionFornecedor.find(new Fornecedor()));
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./compra/manterCompra.jsp");
	}

	@Override
	public void goFind() throws Exception {
		try {
			
			SessionFornecedor sessionFornecedor = new SessionFornecedor();
			request.setAttribute("listFornecedor",sessionFornecedor.find(new Fornecedor()));
			
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./compra/consultarCompra.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","Compra salvo com sucesso!");
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