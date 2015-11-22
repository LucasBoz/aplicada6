package br.edu.udc.aplicada6.controller;


public class ControllerMarca extends Controller {

	public ControllerMarca() throws Exception {
		super("Marca");
	}

	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./marca/manterMarca.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./marca/consultarMarca.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","Marca salva com sucesso!");
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