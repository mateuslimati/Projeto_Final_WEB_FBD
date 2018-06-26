package model;

import java.util.Date;

public class Aluguel {
	
	public Aluguel(int id_cli, int id_item, Date data_aluguel, Date data_devolucao) {
		super();
		this.id_cli = id_cli;
		this.id_item = id_item;
		this.data_aluguel = data_aluguel;
		this.data_devolucao = data_devolucao;
	}
	private int id;
	private int id_cli;
	private int id_item;
	private Date data_aluguel;
	private Date data_devolucao;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_cli() {
		return id_cli;
	}
	public void setId_cli(int id_cli) {
		this.id_cli = id_cli;
	}
	public int getId_item() {
		return id_item;
	}
	public void setId_item(int id_item) {
		this.id_item = id_item;
	}
	public Date getData_aluguel() {
		return data_aluguel;
	}
	public void setData_aluguel(Date data_aluguel) {
		this.data_aluguel = data_aluguel;
	}
	public Date getData_devolucao() {
		return data_devolucao;
	}
	public void setData_devolucao(Date data_devolucao) {
		this.data_devolucao = data_devolucao;
	}

}
