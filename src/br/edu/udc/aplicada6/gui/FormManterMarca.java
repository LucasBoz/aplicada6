package br.edu.udc.aplicada6.gui;

import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import br.edu.udc.aplicada6.dao.DaoMarca;
import br.edu.udc.aplicada6.entity.Marca;

public class FormManterMarca extends FormManter {

	private static final long serialVersionUID = 1L;

	private JTextField tfIdMarca;
	private JTextField tfDescricao;

	public FormManterMarca() {
		super();
	}

	@Override
	public void createFields() {
		this.tfIdMarca = new JTextField();
		this.tfIdMarca.setEnabled(false);
		this.fieldsPanel.add(new JLabel("Código:"));
		this.fieldsPanel.add(this.tfIdMarca);
		this.fieldsPanel.add(new JLabel(""));
		this.tfDescricao = new JTextField();
		this.fieldsPanel.add(new JLabel("Descrição:"));
		this.fieldsPanel.add(this.tfDescricao);
	}
	
	@Override
	public Boolean validar() throws Exception {
		if (this.tfDescricao.getText().trim().equals("")) {
			JOptionPane.showMessageDialog(null, "Preencha a Descrição!", "Aviso", JOptionPane.WARNING_MESSAGE);
			this.tfDescricao.setText("");
			this.tfDescricao.requestFocus();
			return false;
		}
		return true;
	}

	@Override
	public void save() throws Exception {
		DaoMarca daoMarca=new DaoMarca();
		Marca marca = new Marca();
		marca.setIdMarca(Integer.parseInt(this.tfIdMarca.getText()));
		marca.setDescricao(this.tfDescricao.getText());
		daoMarca.save(marca);
		daoMarca.commit();
		this.tfIdMarca.setText(String.valueOf(marca.getIdMarca()));
	}

	@Override
	public void clean() throws Exception {
		tfIdMarca.setText("");
		tfDescricao.setText("");
		btDelete.setEnabled(false);
		this.tfIdMarca.requestFocus();
	}

	@Override
	public void remove() throws Exception {
		DaoMarca daoMarca=new DaoMarca();
		Marca marca = new Marca();
		marca.setIdMarca(Integer.parseInt(tfIdMarca.getText()));
		daoMarca.remove(marca);
		daoMarca.commit();
		clean();
	}

	@Override
	public void back() throws Exception {
		JInternalFrame internal = this.getInternalFrame();
		internal.setContentPane(new FormConsultarMarca());
		internal.setTitle("Consultar Marca");
	}

	@Override
	public void setObject(Object obj) throws Exception {
		Marca marca = (Marca) obj;
		tfIdMarca.setText(String.valueOf(marca.getIdMarca()));
		tfDescricao.setText(marca.getDescricao());
		btDelete.setEnabled(true);
	}
}