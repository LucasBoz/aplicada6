package br.edu.udc.aplicada6.entity;


import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

@Entity
@Table(tableName="itemServico")
public class ItemServico {
	
	@Id
	@GeneratedValue
	@Column(name="iditemServico",type=Column.INTEGER,unique=true,nullable=false)
	private Integer iditemServico;
	
	@Column(name="idServico",type=Column.OBJECT)
	private Servico Servico;
	
	@Column(name="idproduto",type=Column.OBJECT)
	private Produto produto;
	
	@Column(name="idvenda",type=Column.OBJECT)
	private Venda venda;
		
	@Column(name="quantidade", nullable=false, type=Column.INTEGER)
	private Integer quantidade;
	
	@Column(name="valor", nullable=false, type=Column.FLOAT)
	private Float valor;

	public ItemServico() {
		super();
	}

	public Integer getIditemServico() {
		return iditemServico;
	}

	public void setIditemServico(Integer iditemServico) {
		this.iditemServico = iditemServico;
	}

	public Servico getServico() {
		return Servico;
	}

	public void setServico(Servico servico) {
		Servico = servico;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
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
		return "ItemServico [iditemServico=" + iditemServico + ", Servico=" + Servico + ", produto=" + produto
				+ ", venda=" + venda + ", quantidade=" + quantidade + ", valor=" + valor + "]";
	}
}