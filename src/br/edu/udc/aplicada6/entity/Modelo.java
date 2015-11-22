package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="modelo")
public class Modelo {

	@Id
	@GeneratedValue
	@Column(name="idmodelo",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idModelo;
	
	@Column(name="descricao",type=Column.STRING,length=100)
	private String descricao;
	
	@Column(name="idmarca",type=Column.OBJECT)
	private Marca marca;

	public Integer getIdModelo() {
		return idModelo;
	}

	public void setIdModelo(Integer idModelo) {
		this.idModelo = idModelo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	@Override
	public String toString() {
		return "Modelo [idModelo=" + idModelo + ", descricao=" + descricao + ", marca=" + marca + "]";
	}
	
	
}