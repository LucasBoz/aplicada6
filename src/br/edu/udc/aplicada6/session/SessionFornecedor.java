package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.DaoFornecedor;

public class SessionFornecedor extends Session{

	public SessionFornecedor() throws Exception {
		super(new DaoFornecedor());
	}

}
