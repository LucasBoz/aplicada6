package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="usuario")
public class Usuario {

	@Id
	@GeneratedValue
	@Column(name="idusuario",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idUsuario;
	
	@Column(name="login",type=Column.STRING,length=100)
	private String login;
	
	@Column(name="senha",type=Column.STRING,length=100)
	private String senha;

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", login=" + login + ", senha=" + senha + "]";
	}	
		
	@Override
	public boolean equals(Object obj) {
		if ((obj != null) && (obj instanceof Usuario)) {
			Usuario usuario = (Usuario) obj;
			if (usuario.getIdUsuario() == this.idUsuario) {
				return true;
			}
		}
		return false;
	}
}