package br.edu.udc.aplicada6.controller;

public class ControllerFornecedor extends Controller{

	public ControllerFornecedor() throws Exception {
		super("Fornecedor");
	}
	
	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./fornecedor/manterFornecedor.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./fornecedor/consultarFornecedor.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","Fornecedor salva com sucesso!");
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
