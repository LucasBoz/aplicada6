package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.DaoUsuario;
import br.edu.udc.aplicada6.entity.Usuario;

public class SessionUsuario extends Session {
	
	public SessionUsuario() throws Exception {
		super(new DaoUsuario());
	}
	
	public Usuario login(Object usuario) throws Exception{
		DaoUsuario daoUsuario = (DaoUsuario) this.dao;		
		return daoUsuario.login((Usuario) usuario);
	}
}
