package br.edu.udc.aplicada6.main;

import br.edu.udc.aplicada6.entity.Modelo;
import br.edu.udc.aplicada6.session.Session;
import br.edu.udc.aplicada6.session.SessionModelo;



public class Main {
		
	public static void main(String[] args) throws Exception {

		Session session = new SessionModelo();
		
		Modelo modelo = new Modelo();
		modelo.setDescricao("F");
		
		Object list[] = session.find(modelo);
		for (int i = 0; i < list.length; i++) {
			System.out.println(list[i].toString());
		}
	
	}
}