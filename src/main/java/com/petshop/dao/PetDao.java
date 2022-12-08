package com.petshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.petshop.model.Pet;

public class PetDao {
	public static Connection getConnection() {
		Connection connect = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet", "user", "123456");
			System.out.println("Conectado com sucesso!");
		}catch(Exception e) {
			System.out.println("Erro na conexão");
			System.out.println(e);
		}
		
		return connect;
	}
	
	public static List<Pet> getAllPets() {
		List<Pet> list = new ArrayList<Pet>();
		
		try {
			Connection connect = getConnection();
			PreparedStatement ps = (PreparedStatement) connect.prepareStatement("SELECT * FROM tb_pet");
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				Pet pet = new Pet();
				
				pet.setId(rs.getLong("id"));
				pet.setNome(rs.getString("nome"));
				pet.setRaca(rs.getString("raca"));
				pet.setEspecie(rs.getString("especie"));
				pet.setDono(rs.getString("dono"));
				
				list.add(pet);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	public static int updateById(Pet updatePet) {
		int status = 0;
		
		try {
			Connection connect = getConnection();
			PreparedStatement ps = (PreparedStatement) connect
					.prepareStatement("UPDATE tb_pet SET nome=?,"
							+ "raca=?,"
							+ "especie=?,"
							+ "dono=?"
							+ "WHERE id=?");
			ps.setString(1, updatePet.getNome());
			ps.setString(2, updatePet.getRaca());
			ps.setString(3, updatePet.getEspecie());
			ps.setString(4, updatePet.getDono());
			ps.setLong(5, updatePet.getId());
			status = ps.executeUpdate();			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static Pet getById(Long id) {
		Pet pet = null;
		
		try {
			Connection connect = getConnection();
			PreparedStatement ps = (PreparedStatement) connect.prepareStatement("SELECT * FROM tb_pet WHERE id=?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				pet = new Pet();
				
				pet.setId(rs.getLong("id"));
				pet.setNome(rs.getString("nome"));
				pet.setRaca(rs.getString("raca"));
				pet.setEspecie(rs.getString("especie"));
				pet.setDono(rs.getString("dono"));				
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return pet;
	}
}
