package br.com.opt2.controle_vacina.enums;

public enum Vacina {
	PFIZER("Corminaty(Pfizer/BioNTech)"),
	BUTANTAN("Coronavac(Butantan/SinoVac)"),
	ASTRAZENECA("AstraZeneca(AstraZeneca/Oxford)");
	private String descricao;
	private Vacina(String descricao) {
		this.descricao = descricao;
	}
	public String getDescricao() {
		return descricao;
	}
}
