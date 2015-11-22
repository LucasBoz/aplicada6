package br.edu.udc.aplicada6.entity;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;

//Veiculo (idVeiculo, placa, chassi, Modelo, Cliente, cor)
@Entity
@Table(tableName="veiculo")
public class Veiculo {
	
	@Id
	@GeneratedValue
	@Column(name="idveiculo",type=Column.INTEGER,unique=true,nullable=false)
	private Integer idVeiculo;
	
	@Column(name="placa",type=Column.STRING,length=100, unique=true, nullable=false)
	private String placa;
	
	@Column(name="chassi",type=Column.STRING,length=100, unique=true, nullable=false)
	private String chassi;
	
	@Column(name="idmodelo",type=Column.OBJECT)
	private Modelo modelo;
	
	@Column(name="idcliente",type=Column.OBJECT)
	private Cliente cliente;
	
	@Column(name="cor",type=Column.STRING,length=100, unique=true, nullable=false)
	private String cor;

	public Integer getIdVeiculo() {
		return idVeiculo;
	}

	public void setIdVeiculo(Integer idVeiculo) {
		this.idVeiculo = idVeiculo;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getChassi() {
		return chassi;
	}

	public void setChassi(String chassi) {
		this.chassi = chassi;
	}

	public Modelo getModelo() {
		return modelo;
	}

	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public Veiculo() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ID: " + this.idVeiculo + " - Placa: " + placa + " - Chassi: " + chassi + " - Modelo: " + this.getModelo().getDescricao() + " - Cliente: " + this.getCliente().getNome() ;
	}


}
