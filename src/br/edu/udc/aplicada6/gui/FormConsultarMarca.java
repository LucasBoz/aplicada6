package br.edu.udc.aplicada6.gui;

import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import br.edu.udc.aplicada6.dao.DaoMarca;
import br.edu.udc.aplicada6.entity.Marca;

public class FormConsultarMarca extends FormConsultar {

	private static final long serialVersionUID = 1L;
	
	private JTextField tfDescricao;
	
	public FormConsultarMarca() {
		super();
	}

	@Override
	protected void createFields() {
		this.tfDescricao = new JTextField();
		this.fieldsPanel.add(new JLabel("Descrição:"));
		this.fieldsPanel.add(this.tfDescricao);
	}

	@Override
	protected void find() throws Exception {
		DaoMarca daoMarca = new DaoMarca();
		Marca marca = new Marca();
		marca.setDescricao(tfDescricao.getText());		
		this.list.setListData(daoMarca.find(marca));
	}

	@Override
	protected void goNew() throws Exception {
		JInternalFrame internal = this.getInternalFrame();
		internal.setContentPane(new FormManterMarca());
		internal.setTitle("Manter Marca");
	}

	@Override
	protected void clean() throws Exception {
		tfDescricao.setText("");
		this.list.setListData(new Marca[0]);
	}

	@Override
	protected void detail() throws Exception {
		DaoMarca daoMarca = new DaoMarca();
		Marca marca = (Marca) daoMarca.findByPrimaryKey((Marca)this.list.getSelectedValue());
		if (marca != null) {
			FormManterMarca formManterMarca = new FormManterMarca();
			formManterMarca.setObject(marca);
			
			JInternalFrame internal = this.getInternalFrame();
			internal.setContentPane(formManterMarca);
			internal.setTitle("Manter Marca");
		}
	}
}