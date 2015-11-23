package br.edu.udc.aplicada6.entity;

import java.util.Calendar;
import java.util.List;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;

//Venda (idVenda, Cliente, Veiculo, Lista de ItemVenda,
//Lista de ItemServico, data, descricao, valor)
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
	
	@Column(name="data",type=Column.DATE)
	private Calendar data;
	
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
	public Calendar getData() {
		return data;
	}

	public void setData(Calendar data) {
		this.data = data;
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
			Calendar data, String descricao, Float valor) {
		super();
		this.idVenda = idVenda;
		this.cliente = cliente;
		this.veiculo = veiculo;
/*		this.listItemVenda = listItemVenda;
		this.listItemServico = listItemServico;*/
		this.data = data;
		this.descricao = descricao;
		this.valor = valor;
/*		this.itemVenda = itemVenda;*/
	}
	
}
