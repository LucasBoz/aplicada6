package br.edu.udc.aplicada6.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import br.edu.udc.aplicada6.entity.Usuario;

public class DaoUsuario extends Dao {

	public DaoUsuario() throws Exception {
		super();
	}
	
	public DaoUsuario(Connection connection) throws Exception {
		super(connection);
	}

	public Usuario login(Usuario usuario) throws Exception {
		if (usuario != null) {
			Statement stmt = null;
			ResultSet rst = null;
			try {
				stmt = this.connection.createStatement();
				String sql = "select idusuario,login,senha from usuario " +
						     "where login = '" + usuario.getLogin() + "' and " +
						     "senha = '" + usuario.getSenha() + "'";
				System.out.println(sql);
				rst = stmt.executeQuery(sql);
				Usuario usuarioRetorno = new Usuario();
				if (rst.next()) {
					usuarioRetorno.setIdUsuario(rst.getInt("idusuario"));
					usuarioRetorno.setLogin(rst.getString("login"));
					usuarioRetorno.setSenha(rst.getString("senha"));
					return usuarioRetorno;
				} 				
			} catch (Exception e) {
				try {
					if (this.connection != null) {
						this.rollback();
					}
				} catch (Exception e2) {}
				throw e; 
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (Exception e2) {}
				}
				if (rst != null) {
					try {
						rst.close();
					} catch (Exception e2) {}
				}
			}
		}
		return null;
	}
}