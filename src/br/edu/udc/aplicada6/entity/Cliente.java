package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="cliente")
public class Cliente {
	@Id
	@GeneratedValue
	@Column(name="idcliente",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idCliente;
	
	@Column(name="cpf",type=Column.STRING,length=100, unique=true, nullable=false)
	private String cpf;
	
	@Column(name="nome",type=Column.STRING,length=100)
	private String nome;
	
	@Column(name="rg",type=Column.STRING,length=100, unique=true, nullable=false)
	private String rg;
	
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
	
	@Column(name="logradouro",type=Column.STRING,length=100)
	private String logradouro;

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

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cpf == null) ? 0 : cpf.hashCode());
		result = prime * result + idCliente;
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (obj instanceof Cliente) {
			Cliente other = (Cliente) obj;
			if (this.idCliente == other.getIdCliente()) {
				return true;
			}
		}
		return false; 
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@Override
	public String toString() {
		return "ID = " + this.idCliente + "\n" +
	           "NOME = " + this.nome + "\n" +
			   "CPF = " + this.cpf;
	}
}