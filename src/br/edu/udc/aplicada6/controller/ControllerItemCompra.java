package br.edu.udc.aplicada6.controller;

import br.edu.udc.aplicada6.entity.Compra;
import br.edu.udc.aplicada6.entity.ItemCompra;
import br.edu.udc.aplicada6.entity.Produto;
import br.edu.udc.aplicada6.session.SessionCompra;
import br.edu.udc.aplicada6.session.SessionItemCompra;
import br.edu.udc.aplicada6.session.SessionProduto;



public class ControllerItemCompra extends Controller {

	public ControllerItemCompra() throws Exception {
		super("ItemCompra");
	}

	@Override
	public void goNew() throws Exception {
		try {
			SessionCompra sessionCompra = new SessionCompra();
			SessionProduto sessionProduto = new SessionProduto();
			SessionItemCompra sessionItemCompra = new SessionItemCompra();
			request.setAttribute("listItemCompra",sessionItemCompra.find(new ItemCompra()));
			
			Compra Compra = new Compra();
			Compra.setIdCompra(Integer.parseInt(request.getParameter("id")));
			//busca pelo parametro id Compra
	
			request.setAttribute("listCompra",sessionCompra.find(Compra));
			request.setAttribute("listProduto",sessionProduto.find(new Produto()));
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./compra/addItems.jsp");
	}

	@Override
	public void goFind() throws Exception {
		try {
			SessionProduto sessionProduto = new SessionProduto();
			SessionCompra sessionCompra = new SessionCompra();
			request.setAttribute("listProduto",sessionProduto.find(new Produto()));
			
			
			
			
			SessionItemCompra sessionItemCompra = new SessionItemCompra();
			
			request.setAttribute("listItemCompra",sessionItemCompra.find(new ItemCompra()));
			
			
			
			
			Compra Compra = new Compra();
			Compra.setIdCompra(Integer.parseInt(request.getParameter("id")));
			//busca pelo parametro id Compra
			request.setAttribute("listCompra",sessionCompra.find(Compra));
			
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./compra/addItems.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","itemCompra salvo com sucesso!");
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