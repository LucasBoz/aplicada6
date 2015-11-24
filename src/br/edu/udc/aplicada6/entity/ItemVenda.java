package br.edu.udc.aplicada6.entity;


import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="itemvenda")
public class ItemVenda {
	
	@Id
	@GeneratedValue
	@Column(name="iditemvenda",type=Column.INTEGER,unique=true,nullable=false)
	private Integer iditemVenda;
	
	@Column(name="idvenda",type=Column.OBJECT)
	private Venda venda;
	
	@Column(name="idproduto",type=Column.OBJECT)
	private Produto produto;
	
	@Column(name="quantidade", nullable=false, type=Column.INTEGER)
	private Integer quantidade;
	
	@Column(name="valor", nullable=false, type=Column.FLOAT)
	private Float valor;

	public ItemVenda() {
		super();
	}

	public Integer getIditemVenda() {
		return iditemVenda;
	}

	public void setIditemVenda(Integer iditemVenda) {
		this.iditemVenda = iditemVenda;
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
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
		return "itemVenda [iditemVenda=" + iditemVenda + ", venda=" + venda + ", produto=" + produto + ", quantidade="
				+ quantidade + ", valor=" + valor + "]";
	}


	
	
	
}
