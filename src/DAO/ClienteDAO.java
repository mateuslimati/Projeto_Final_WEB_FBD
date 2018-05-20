package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xpath.internal.operations.Bool;

import JDBC.ConnectionFactory;
import model.Cliente;

public class ClienteDAO {

	private Connection pessoaConection;
	
	public void insert(Cliente cliente){
		
		String sql = "insert into clientes(nome, email, senha) values (?, ?, ?);";
		this.pessoaConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = pessoaConection.prepareStatement(sql);
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getEmail());
			stmt.setString(3, cliente.getSenha());
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				pessoaConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void updadeSenha(Cliente cliente){
		
		String sql = "update clientes set senha = ?;";
		this.pessoaConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = pessoaConection.prepareStatement(sql);
			stmt.setString(1, cliente.getSenha());
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				pessoaConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void delete(String email){
		
		String sql = "delete from clientes where email = ?;";
		this.pessoaConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = pessoaConection.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.executeUpdate();
			stmt.close();

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				pessoaConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}			

	}
	
	
	public Cliente getByEmail(String email){
		
		String sql = "select * from clientes where email = ?;";
		this.pessoaConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = pessoaConection.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				Cliente c = new Cliente(rs.getString("nome"), rs.getString("email"), rs.getString("senha"));
				c.setId(rs.getInt("id"));
				c.setEndereco("endereco");
				stmt.close();
				return c;
			}
			return null;
		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				pessoaConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	public List<Cliente> getClientes(){
		
		String sql = "select * from clientes;";
		this.pessoaConection = new ConnectionFactory().getConnection();
		PreparedStatement stmt;

		try{
			stmt = pessoaConection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			List<Cliente> list = new ArrayList<Cliente>();
			while(rs.next()){
				Cliente c = new Cliente(rs.getString("nome"), rs.getString("email"), rs.getString("senha"));
				c.setId(rs.getInt("id"));
				c.setEndereco("endereco");
				list.add(c);
			}
			stmt.close();
			return list;

		}catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				pessoaConection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
	
}

