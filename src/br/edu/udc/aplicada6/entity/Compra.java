package br.edu.udc.aplicada6.entity;

import java.util.Calendar;
import java.util.List;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

//Compra (idCompra, Fornecedor,Lista de ItemCompra,
//data, descricao, valor)
@Entity
@Table(tableName="Compra")
public class Compra {
	
	@Id
	@GeneratedValue
	@Column(name="idCompra",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idCompra;
	
	@Column(name="idfornecedor",type=Column.OBJECT)
	private Fornecedor fornecedor;
	
	
	@Column(name="datav",type=Column.DATE)
	private Calendar datav;
	
	@Column(name="descricao", nullable=false, type=Column.STRING)
	private String descricao;
	
	@Column(name="valor", nullable=false, type=Column.FLOAT)
	private Float valor;
	

	public Integer getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(Integer idCompra) {
		this.idCompra = idCompra;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public Calendar getDatav() {
		return datav;
	}

	public void setDatav(Calendar datav) {
		this.datav = datav;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Float getValor() {
		return valor;
	}

	public void setValor(Float valor) {
		this.valor = valor;
	}

	
	@Override
	public String toString() {
		return "Compra [idCompra=" + idCompra + ", fornecedor=" + fornecedor + ", datav=" + datav
				+ ", descricao=" + descricao + ", valor=" + valor + "]";
	}
	
	
	
}
