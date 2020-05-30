package com.examen.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_cliente")
public class Cliente {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_cliente")
	private int codCliente;
	
	@Column(name = "nom_cliente")
	private String nomCliente;
	
	@Column(name = "ape_cliente")
	private String apeCliente;
	
	@Column(name = "dni_cliente")
	private String dniCliente;
	
	@Column(name = "fec_nac_cliente")
	private String fnacCliente;
	
	@ManyToOne
	@JoinColumn(name ="cod_tipo")
	private Tipo tb_tipo;
	
	public int getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(int codCliente) {
		this.codCliente = codCliente;
	}

	public String getNomCliente() {
		return nomCliente;
	}

	public void setNomCliente(String nomCliente) {
		this.nomCliente = nomCliente;
	}

	public String getApeCliente() {
		return apeCliente;
	}

	public void setApeCliente(String apeCliente) {
		this.apeCliente = apeCliente;
	}

	public String getDniCliente() {
		return dniCliente;
	}

	public void setDniCliente(String dniCliente) {
		this.dniCliente = dniCliente;
	}

	public String getFnacCliente() {
		return fnacCliente;
	}

	public void setFnacCliente(String fnacCliente) {
		this.fnacCliente = fnacCliente;
	}

	public Tipo getTipo() {
		return tb_tipo;
	}

	public void setTipo(Tipo tipo) {
		this.tb_tipo = tipo;
	}


	
	
}
