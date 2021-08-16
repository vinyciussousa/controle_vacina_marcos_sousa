package br.com.opt2.controle_vacina.domain;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import br.com.opt2.controle_vacina.enums.Vacina;

@Entity
@Table(name="pessoa")
public class Pessoa {
	@Id
	@Column(name="cpf")
	private Long cpf;
	@Column(name="nome")
	private String nome;
	@Column(name="uf")
	private String uf;
	@Column(name="cidade")
	private String cidade;
	@Column(name="data")
	private Calendar data;
	@Column(name="vacina")
	private Vacina vacina;
	@Column(name="responsavel")
	private String responsavel;
	@Column(name="segunda")
	private Calendar segunda;
	
	
	public Long getCpf() {
		return cpf;
	}


	public void setCpf(Long cpf) {
		this.cpf = cpf;
	}

	
	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getUf() {
		return uf;
	}


	public void setUf(String uf) {
		this.uf = uf;
	}


	public String getCidade() {
		return cidade;
	}


	public void setCidade(String cidade) {
		this.cidade = cidade;
	}


	public Calendar getData() {
		return data;
	}


	public void setData(Calendar data) {
		this.data = data;
	}


	public Vacina getVacina() {
		return vacina;
	}


	public void setVacina(Vacina vacina) {
		this.vacina = vacina;
	}


	public String getResponsavel() {
		return responsavel;
	}


	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}


	public Calendar getSegunda() {
		return segunda;
	}


	public void setSegunda(Calendar segunda) {
		this.segunda = segunda;
	}
}
