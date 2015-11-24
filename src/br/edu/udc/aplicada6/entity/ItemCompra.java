package br.edu.udc.aplicada6.entity;


import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="itemcompra")
public class ItemCompra {
	
	@Id
	@GeneratedValue
	@Column(name="iditemcompra",type=Column.INTEGER,unique=true,nullable=false)
	private Integer iditemCompra;
	
	@Column(name="idCompra",type=Column.OBJECT)
	private Compra Compra;
	
	@Column(name="idproduto",type=Column.OBJECT)
	private Produto produto;
	
	@Column(name="quantidade", nullable=false, type=Column.INTEGER)
	private Integer quantidade;
	
	@Column(name="valor", nullable=false, type=Column.FLOAT)
	private Float valor;

	public ItemCompra() {
		super();
	}

	public Integer getIditemCompra() {
		return iditemCompra;
	}

	public void setIditemCompra(Integer iditemCompra) {
		this.iditemCompra = iditemCompra;
	}

	public Compra getCompra() {
		return Compra;
	}

	public void setCompra(Compra Compra) {
		this.Compra = Compra;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Float getValor() {
		return valor;
	}

	public void setValor(Float valor) {
		this.valor = valor;
	}

	@Override
	public String toString() {
		return "itemCompra [iditemCompra=" + iditemCompra + ", Compra=" + Compra + ", produto=" + produto + ", quantidade="
				+ quantidade + ", valor=" + valor + "]";
	}


	
	
	
}
