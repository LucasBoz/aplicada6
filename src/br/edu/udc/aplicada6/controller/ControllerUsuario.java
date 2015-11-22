package br.edu.udc.aplicada6.controller;

public class ControllerUsuario extends Controller {

	public ControllerUsuario() throws Exception {
		super("Usuario");
	}

	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./usario/manterUsuario.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./usario/consultarUsuario.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		request.setAttribute("msg","Usuário salvo com sucesso!");
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
	
	public void login(Object obj) throws Exception {
		if (obj != null) {
			this.request.getSession().setAttribute("loggedUser", obj);
			request.setAttribute("nextPage","./main.jsp");
		} else {
			throw new Exception("Usuário inválido!");
		}
	}
	
	public void logout() throws Exception {
		this.request.getSession().removeAttribute("loggedUser");
		request.setAttribute("nextPage","./index.jsp");
	}	
}
