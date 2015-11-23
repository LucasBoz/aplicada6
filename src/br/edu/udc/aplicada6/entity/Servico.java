package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="servico")
public class Servico {
	@Id
	@GeneratedValue
	@Column(name="idservico",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idServico;
	
	@Column(name="descricao",type=Column.STRING,length=100)
	private String descricao;
	
	@Column(name="valor",type=Column.FLOAT)
	private Float valor;
	

	public Float getValor() {
		return valor;
	}

	public void setValor(Float valor) {
		this.valor = valor;
	}

	public Integer getIdServico() {
		return idServico;
	}

	public void setIdServico(Integer idServico) {
		this.idServico = idServico;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Override
	public String toString() {
		return "Servico [idServico=" + idServico + ", descricao=" + descricao + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if ((obj != null) && (obj instanceof Servico)) {
			Servico servico = (Servico) obj;
			if (servico.getIdServico() == this.idServico) {
				return true;
			}
		}
		return false;
	}
}
