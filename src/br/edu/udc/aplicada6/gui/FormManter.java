package br.edu.udc.aplicada6.gui;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import br.edu.udc.aplicada6.dao.DaoMarca;
import br.edu.udc.aplicada6.entity.Marca;

public abstract class FormManter extends Form {
	private static final long serialVersionUID = 1L;
	
	protected class EventManager implements MouseListener {
		@Override
		public void mouseClicked(MouseEvent e) {}
		@Override
		public void mouseEntered(MouseEvent e) {}
		@Override
		public void mouseExited(MouseEvent e) {}
		@Override
		public void mousePressed(MouseEvent e) {
			try {
				if (e.getSource().equals(btSave)) {
					if (validar()) {
						save();
					}
				} else if (e.getSource().equals(btClean)) {
					clean();
				} else if (e.getSource().equals(btDelete)) {
					if ((btDelete.isEnabled()) &&
						(JOptionPane.showConfirmDialog(null,
							                          "Confirma Exclusão?",
							                          "Aviso",
							                          JOptionPane.YES_NO_OPTION,
							                          JOptionPane.QUESTION_MESSAGE) == JOptionPane.YES_OPTION)) {
						remove();
					}
				} else if (e.getSource().equals(btBack)) {
					back();
				}
			} catch (Exception e1) {
				JOptionPane.showMessageDialog(null, e1.getMessage());
			}
		}
		@Override
		public void mouseReleased(MouseEvent e) {}
	}

	protected JButton btSave;
	protected JButton btClean;
	protected JButton btDelete;
	protected JButton btBack;
	
	protected JPanel fieldsPanel;
	protected JPanel buttonsPanel;
	
	
	public FormManter() {
		this.createPanels();
		this.createButtons();
		this.createFields();
	}
	
	private void createPanels() {
		this.setLayout(new BorderLayout());
		
		this.fieldsPanel = new JPanel();
		this.fieldsPanel.setLayout(new GridLayout(0,3));
		this.buttonsPanel = new JPanel();
		this.buttonsPanel.setLayout(new FlowLayout());
		
		this.add(this.fieldsPanel,BorderLayout.NORTH);
		this.add(this.buttonsPanel,BorderLayout.SOUTH);
	}
	
	private void createButtons() {
		this.btSave = new JButton("Salvar");
		this.btClean = new JButton("Limpar");
		this.btDelete = new JButton("Excluir");
		this.btDelete.setEnabled(false);
		this.btBack = new JButton("Voltar");
		
		this.buttonsPanel.add(this.btSave);
		this.buttonsPanel.add(this.btClean);
		this.buttonsPanel.add(this.btDelete);
		this.buttonsPanel.add(this.btBack);		
		
		EventManager eventManager = new EventManager();
		this.btSave.addMouseListener(eventManager);		
		this.btClean.addMouseListener(eventManager);
		this.btDelete.addMouseListener(eventManager);
		this.btBack.addMouseListener(eventManager);
	}

	public abstract void createFields();
	public abstract Boolean validar() throws Exception;
	public abstract void save() throws Exception;
	public abstract void clean() throws Exception;
	public abstract void remove() throws Exception;
	public abstract void back() throws Exception;
	public abstract void setObject(Object obj) throws Exception;
}