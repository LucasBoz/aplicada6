package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

//Produto (idProduto, descricao, valor, quantidade)
@Entity
@Table(tableName="Produto")
public class Produto {
	
	@Id
	@GeneratedValue
	@Column(name="idProduto",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idProduto;
	
	@Column(name="descricao",type=Column.STRING,length=100)
	private String descricao;
	
	@Column(name="valor",type=Column.FLOAT,length=100)
	private Float valor;
	
	@Column(name="quantidade",type=Column.INTEGER)
	private Integer quantidade;
		

	public Integer getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
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

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Produto() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "idProduto: " +idProduto+ " Descricao: " + descricao+" Valor :"+valor+" Quantidade: "+quantidade ;
	}
	
}
