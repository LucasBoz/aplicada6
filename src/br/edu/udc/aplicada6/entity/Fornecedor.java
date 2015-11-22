package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="fornecedor")
public class Fornecedor {
	@Id
	@GeneratedValue
	@Column(name="idfornecedor",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idFornecedor;
	
	@Column(name="razao_social",type=Column.STRING, length=100)
	private String razaoSocial;
	
	@Column(name="cnpj", type=Column.STRING, length=100)
	private String cnpj;
	
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

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
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

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public Integer getIdFornecedor() {
		return idFornecedor;
	}

	public void setIdFornecedor(Integer idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public Fornecedor() {
		super();
	}

	

	


	
}
