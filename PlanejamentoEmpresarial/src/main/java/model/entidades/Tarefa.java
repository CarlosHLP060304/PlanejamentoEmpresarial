package model.entidades;

import java.time.LocalDate;


public class Tarefa {
	int id;
	String descricao;
	LocalDate dataInicio;
	LocalDate dataFinalizacao;
	String link;
	Boolean finalizada;
    public Tarefa() {}

	public Tarefa(int id, String descricao, LocalDate dataInicio, LocalDate dataFinalizacao, String link,
			Boolean finalizada) {
		this.id = id;
		this.descricao = descricao;
		this.dataInicio = dataInicio;
		this.dataFinalizacao = dataFinalizacao;
		this.link = link;
		this.finalizada = finalizada;
	}

	public Tarefa(String descricao, LocalDate dataInicio, LocalDate dataFinalizacao, String link, Boolean finalizada) {
		this.descricao = descricao;
		this.dataInicio = dataInicio;
		this.dataFinalizacao = dataFinalizacao;
		this.link = link;
		this.finalizada = finalizada;
	}

	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public LocalDate getDataFinalizacao() {
		return dataFinalizacao;
	}
	public void setDataFinalizacao(LocalDate dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Boolean getFinalizada() {
		return finalizada;
	}
	public void setFinalizada(Boolean finalizada) {
		this.finalizada = finalizada;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}

	public String getDataInicioFormatada() {
		String dataFormatada = dataInicio.getDayOfMonth() +"/" +dataInicio.getMonthValue() +"/" + dataInicio.getYear();
		return dataFormatada;
	}
		
	public String getDataFinalizacaoFormatada() {
		String dataFormatada = dataFinalizacao.getDayOfMonth() +"/" +dataFinalizacao.getMonthValue() +"/" + dataFinalizacao.getYear();
	    return dataFormatada;
	}
	
	
	
	
}
