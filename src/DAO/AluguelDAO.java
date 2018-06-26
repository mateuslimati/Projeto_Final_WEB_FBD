package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import JDBC.ConnectionFactory;
import model.Aluguel;

public class AluguelDAO {
	private Connection aluguelConection;
	
	public void insert(Aluguel aluguel){
		
		String sql = "insert into alugueis (id_cli, id_item, data_aluguel) values (?, ?, ?);";
		this.aluguelConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;
		
		java.sql.Date d = new java.sql.Date(aluguel.getData_aluguel().getTime());

		try{
			stmt = aluguelConection.prepareStatement(sql);
			stmt.setInt(1, aluguel.getId_cli());
			stmt.setInt(2, aluguel.getId_item());
			stmt.setDate(3, d);
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				aluguelConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}	

	public void setDevolucao(int id, Date data){
		
		String sql = "update alugueis set data_devolucao = ? where id = ?;";
		this.aluguelConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;
		java.sql.Date d = new java.sql.Date(data.getTime());

		try{
			stmt = aluguelConection.prepareStatement(sql);
			stmt.setDate(1, d);
			stmt.setInt(2, id);
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				aluguelConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}	
	
	public void delete(int id){
		
		String sql = "delete from alugueis where id = ?;";
		this.aluguelConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = aluguelConection.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				aluguelConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}			

	}
	
	
	public Aluguel getById(int id){
		
		String sql = "select * from alugueis where id = ?;";
		this.aluguelConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = aluguelConection.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				Aluguel c = new Aluguel(rs.getInt("id_cli"), rs.getInt("id_item"), rs.getDate("data_aluguel"), rs.getDate("data_devolucao"));
				c.setId(rs.getInt("id"));
				stmt.close();
				return c;
			}
			return null;
		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				aluguelConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	public List<Aluguel> getAlugueis(){
		
		String sql = "select * from alugueis;";
		this.aluguelConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = aluguelConection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			List<Aluguel> list = new ArrayList<Aluguel>();
			while(rs.next()){
				Aluguel c = new Aluguel(rs.getInt("id_cli"), rs.getInt("id_item"), rs.getDate("data_aluguel"), rs.getDate("data_devolucao"));
				c.setId(rs.getInt("id"));
				list.add(c);
			}
			stmt.close();
			return list;

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				aluguelConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
	
}
