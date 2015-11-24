package br.edu.udc.aplicada6.controller;

import br.edu.udc.aplicada6.entity.Venda;
import br.edu.udc.aplicada6.entity.ItemVenda;
import br.edu.udc.aplicada6.entity.Produto;
import br.edu.udc.aplicada6.session.SessionVenda;
import br.edu.udc.aplicada6.session.SessionItemVenda;
import br.edu.udc.aplicada6.session.SessionProduto;



public class ControllerItemVenda extends Controller {

	public ControllerItemVenda() throws Exception {
		super("ItemVenda");
	}

	@Override
	public void goNew() throws Exception {
		try {
			SessionVenda sessionVenda = new SessionVenda();
			SessionProduto sessionProduto = new SessionProduto();
			SessionItemVenda sessionItemVenda = new SessionItemVenda();
			request.setAttribute("listItemVenda",sessionItemVenda.find(new ItemVenda()));
			
			Venda venda = new Venda();
			venda.setIdVenda(Integer.parseInt(request.getParameter("id")));
			//busca pelo parametro id venda
	
			request.setAttribute("listVenda",sessionVenda.find(venda));
			request.setAttribute("listProduto",sessionProduto.find(new Produto()));
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./venda/addItems.jsp");
	}

	@Override
	public void goFind() throws Exception {
		try {
			SessionProduto sessionProduto = new SessionProduto();
			SessionVenda sessionVenda = new SessionVenda();
			request.setAttribute("listProduto",sessionProduto.find(new Produto()));
			
			
			
			
			SessionItemVenda sessionItemVenda = new SessionItemVenda();
			
			request.setAttribute("listItemVenda",sessionItemVenda.find(new ItemVenda()));
			
			
			
			
			Venda venda = new Venda();
			venda.setIdVenda(Integer.parseInt(request.getParameter("id")));
			//busca pelo parametro id venda
			request.setAttribute("listVenda",sessionVenda.find(venda));
			
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./venda/addItems.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","itemVenda salvo com sucesso!");
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