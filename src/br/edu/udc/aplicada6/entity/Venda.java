package br.edu.udc.aplicada6.entity;

import java.util.Calendar;
import java.util.List;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

//Venda (idVenda, Cliente, Veiculo, Lista de ItemVenda,
//Lista de ItemServico, data, descricao, valor)
@Entity
@Table(tableName="venda")
public class Venda {
	
	@Id
	@GeneratedValue
	@Column(name="idvenda",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idVenda;
	
	@Column(name="idcliente",type=Column.OBJECT)
	private Cliente cliente;
	
	@Column(name="idveiculo",type=Column.OBJECT)
	private Veiculo veiculo;
/*	
	private List<ItemVenda> listItemVenda;
	
	private List<ItemServico> listItemServico;*/
	
	@Column(name="datav",type=Column.DATE)
	private Calendar datav;
	
	@Column(name="descricao", nullable=false, type=Column.STRING)
	private String descricao;
	
	@Column(name="valor", nullable=false, type=Column.FLOAT)
	private Float valor;
	
	public Integer getIdVenda() {
		return idVenda;
	}

	public void setIdVenda(Integer idVenda) {
		this.idVenda = idVenda;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Veiculo getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}

/*	public List<ItemVenda> getListItemVenda() {
		return listItemVenda;
	}

	public void setListItemVenda(List<ItemVenda> listItemVenda) {
		this.listItemVenda = listItemVenda;
	}

	public List<ItemServico> getListItemServico() {
		return listItemServico;
	}

	public void setListItemServico(List<ItemServico> listItemServico) {
		this.listItemServico = listItemServico;
	}
*/
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

	public Venda() {
		super();
	}

	public Venda(Integer idVenda, Cliente cliente, Veiculo veiculo,
/*			List<ItemVenda> listItemVenda, List<ItemServico> listItemServico,*/
			Calendar datav, String descricao, Float valor) {
		super();
		this.idVenda = idVenda;
		this.cliente = cliente;
		this.veiculo = veiculo;
/*		this.listItemVenda = listItemVenda;
		this.listItemServico = listItemServico;*/
		this.datav = datav;
		this.descricao = descricao;
		this.valor = valor;
/*		this.itemVenda = itemVenda;*/
	}

	@Override
	public String toString() {
		return "Venda [idVenda=" + idVenda + ", cliente=" + cliente + ", veiculo=" + veiculo + ", datav=" + datav
				+ ", descricao=" + descricao + ", valor=" + valor + "]";
	}
	
	
	
}
