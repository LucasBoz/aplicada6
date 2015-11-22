package br.edu.udc.aplicada6.gui;

import java.awt.Container;

import javax.swing.JInternalFrame;
import javax.swing.JPanel;

public abstract class Form extends JPanel {

	private static final long serialVersionUID = 1L;

	protected JInternalFrame getInternalFrame() {
		Container c = this.getParent();
		int i=0;
		while (!(c instanceof JInternalFrame)) {
			c = c.getParent();
			i++;
			if (i >10) {
				return null;
			}
		}
		return (JInternalFrame) c;
	}
}