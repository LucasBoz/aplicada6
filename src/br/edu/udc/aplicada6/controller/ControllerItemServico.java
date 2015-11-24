package br.edu.udc.aplicada6.controller;

import br.edu.udc.aplicada6.entity.Servico;
import br.edu.udc.aplicada6.entity.Venda;
import br.edu.udc.aplicada6.entity.ItemServico;
import br.edu.udc.aplicada6.entity.Produto;
import br.edu.udc.aplicada6.session.SessionServico;
import br.edu.udc.aplicada6.session.SessionVenda;
import br.edu.udc.aplicada6.session.SessionItemServico;
import br.edu.udc.aplicada6.session.SessionProduto;



public class ControllerItemServico extends Controller {

	public ControllerItemServico() throws Exception {
		super("ItemServico");
	}

	@Override
	public void goNew() throws Exception {
		try {
			SessionVenda sessionVenda = new SessionVenda();
			SessionServico sessionServico = new SessionServico();
			SessionProduto sessionProduto = new SessionProduto();
			SessionItemServico sessionItemServico = new SessionItemServico();
			request.setAttribute("listItemServico",sessionItemServico.find(new ItemServico()));
			
			Venda venda = new Venda();
			venda.setIdVenda(Integer.parseInt(request.getParameter("id")));
			//busca pelo parametro id Servico
			request.setAttribute("listVenda",sessionVenda.find(venda));
			
			
			request.setAttribute("listServico",sessionServico.find(new Servico()));
			request.setAttribute("listProduto",sessionProduto.find(new Produto()));
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./venda/addServicos.jsp");
	}

	@Override
	public void goFind() throws Exception {
		try {
			SessionVenda sessionVenda = new SessionVenda();
			SessionServico sessionServico = new SessionServico();
			SessionProduto sessionProduto = new SessionProduto();
			SessionItemServico sessionItemServico = new SessionItemServico();
			request.setAttribute("listItemServico",sessionItemServico.find(new ItemServico()));
			
			Venda venda = new Venda();
			venda.setIdVenda(Integer.parseInt(request.getParameter("id")));
			//busca pelo parametro id Servico
			request.setAttribute("listVenda",sessionVenda.find(venda));
			
			
			request.setAttribute("listServico",sessionServico.find(new Servico()));
			request.setAttribute("listProduto",sessionProduto.find(new Produto()));
			
		} catch (Exception e) {
		}
		request.setAttribute("nextPage","./venda/addServicos.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","itemServico salvo com sucesso!");
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