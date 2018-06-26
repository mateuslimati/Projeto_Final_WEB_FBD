package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import JDBC.ConnectionFactory;
import model.Cliente;
import model.Item;

public class ItemDAO {

	private Connection itemConection;
	
	public void insert(Item item){
		
		String sql = "insert into itens(nome, descricao, preco, quantidade) values (?, ?, ?, ?);";
		this.itemConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = itemConection.prepareStatement(sql);
			stmt.setString(1, item.getNome());
			stmt.setString(2, item.getDescricao());
			stmt.setDouble(3, item.getPreco());
			stmt.setInt(4, item.getQuantidade());
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				itemConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void updadePreco(Item item){
		
		String sql = "update itens set preco = ? where nome = ?;";
		this.itemConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = itemConection.prepareStatement(sql);
			stmt.setDouble(1, item.getPreco());
			stmt.setString(2, item.getNome());
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				itemConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void delete(String nome){
		
		String sql = "delete from itens where nome = ?;";
		this.itemConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = itemConection.prepareStatement(sql);
			stmt.setString(1, nome);
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				itemConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}			

	}
	
	public Item getByNome(String nome){
		
		String sql = "select * from itens where nome = ?;";
		this.itemConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = itemConection.prepareStatement(sql);
			stmt.setString(1, nome);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				Item c = new Item(rs.getString("nome"), rs.getString("descricao"), rs.getDouble("preco"), rs.getInt("quantidade"));
				c.setId(rs.getInt("id"));
				stmt.close();
				return c;
			}
			return null;
		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				itemConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	public Item getById(int id){
		
		String sql = "select * from itens where id = ?;";
		this.itemConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = itemConection.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				Item c = new Item(rs.getString("nome"), rs.getString("descricao"), rs.getDouble("preco"), rs.getInt("quantidade"));
				c.setId(rs.getInt("id"));
				stmt.close();
				return c;
			}
			return null;
		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				itemConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}	
	
	public List<Item> getAlugueis(){
		
		String sql = "select * from itens;";
		this.itemConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = itemConection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			List<Item> list = new ArrayList<Item>();
			while(rs.next()){
				Item c = new Item(rs.getString("nome"), rs.getString("descricao"), rs.getDouble("preco"), rs.getInt("quantidade"));
				c.setId(rs.getInt("id"));
				list.add(c);
			}
			stmt.close();
			return list;

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				itemConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
	
}
