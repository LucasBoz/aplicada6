package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="marca")
public class Marca {
	@Id
	@GeneratedValue
	@Column(name="idmarca",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idMarca;
	
	@Column(name="descricao",type=Column.STRING,length=100)
	private String descricao;

	public Integer getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(Integer idMarca) {
		this.idMarca = idMarca;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Override
	public String toString() {
		return "Marca [idMarca=" + idMarca + ", descricao=" + descricao + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if ((obj != null) && (obj instanceof Marca)) {
			Marca marca = (Marca) obj;
			if (marca.getIdMarca() == this.idMarca) {
				return true;
			}
		}
		return false;
	}
}
