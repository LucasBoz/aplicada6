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
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;

import br.edu.udc.aplicada6.dao.DaoMarca;
import br.edu.udc.aplicada6.entity.Marca;

public abstract class FormConsultar extends Form {
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
				if (e.getSource().equals(btFind)) {
					find();
				} else if (e.getSource().equals(btNew)) {
					goNew();
				} else if (e.getSource().equals(btClean)) {
					clean();
				} else if (e.getSource().equals(list)) {
					detail();
				}
			} catch(Exception e1) {
				JOptionPane.showMessageDialog(null, e1.getMessage());
			}
		}
		@Override
		public void mouseReleased(MouseEvent e) {}
	}

	protected JButton btFind;
	protected JButton btNew;
	protected JButton btClean;
	
	protected JList <Object> list;
	
	protected JPanel fieldsPanel; 
	protected JPanel buttonsPanel;
	
	public FormConsultar() {
		this.createPanels();
		this.createButtons();
		this.createList();
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
		this.btFind = new JButton("Consultar");
		this.btNew = new JButton("Novo");
		this.btClean = new JButton("Limpar");
		
		this.buttonsPanel.add(this.btFind);
		this.buttonsPanel.add(this.btNew);
		this.buttonsPanel.add(this.btClean);		
		
		EventManager eventManager = new EventManager();
		this.btFind.addMouseListener(eventManager);
		this.btNew.addMouseListener(eventManager);
		this.btClean.addMouseListener(eventManager);
	}
	
	private void createList() {
		this.list = new JList <Object> ();
		this.add(new JScrollPane(this.list),BorderLayout.CENTER);
		
		EventManager eventManager = new EventManager();
		this.list.addMouseListener(eventManager);
	}
	
	protected abstract void createFields();
	protected abstract void find() throws Exception;
	protected abstract void goNew() throws Exception;
	protected abstract void clean() throws Exception;
	protected abstract void detail() throws Exception;
}
