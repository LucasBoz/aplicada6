package br.edu.udc.aplicada6.controller;

public class ControllerVeiculo extends Controller{

	public ControllerVeiculo() throws Exception {
		super("Veiculo");
	}
	
	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./veiculo/manterVeiculo.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./veiculo/consultarVeiculo.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","Veiculo salva com sucesso!");
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
