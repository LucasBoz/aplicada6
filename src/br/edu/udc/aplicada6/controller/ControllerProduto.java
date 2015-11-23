package br.edu.udc.aplicada6.controller;


public class ControllerProduto extends Controller {

	public ControllerProduto() throws Exception {
		super("Produto");
	}

	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./produto/manterProduto.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./produto/consultarProduto.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","Produto salva com sucesso!");
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