package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.conexao.Conexao;

public class ClasseDAO {
	String sql;
	Conexao conexao;
	PreparedStatement ps;
	ResultSet rs;
	
	ClasseDAO(){
		conexao = new Conexao();
	}
	
}
