package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="endereco")
public class Endereco {
	@Id
	@GeneratedValue
	@Column(name="idendereco",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idEndereco;
	
	@Column(name="numero",type=Column.INTEGER)
	private Integer numero;
	
	@Column(name="bairro",type=Column.STRING,length=100)
	private String bairro;
	
	@Column(name="cidade",type=Column.STRING,length=100)
	private String cidade;
	
	@Column(name="estado",type=Column.STRING,length=100)
	private String estado;
	
	@Column(name="cep",type=Column.STRING,length=100)
	private String cep;
	
	@Column(name="nome",type=Column.STRING,length=100)
	private String logradouro;
	
	public Integer getIdEndereco() {
		return idEndereco;
	}

	public void setIdEndereco(Integer idEndereco) {
		this.idEndereco = idEndereco;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	@Override
	public String toString() {
		return "Endere�o N� " + numero + ", B:=" + bairro
				+ ", cidade=" + cidade + ", estado=" + estado + ", cep=" + cep
				+ ", logradouro=" + logradouro;
	}

	public Endereco() {
		super();
	}

}
