package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entidades.Tarefa;

public class TarefaDAO extends ClasseDAO {
     
	public void inserir(Tarefa tarefa){
    	 sql = "insert into tarefa_empresa(id,descricao,data_finalizacao,link_acesso,finalizada) values(seq_id_tarefa.nextval,?,?,?,?)";
    	 try(Connection conn = conexao.conectar()){
    		 ps = conn.prepareStatement(sql);
    		 ps.setString(1,tarefa.getDescricao());
    		 ps.setDate(2,Date.valueOf(tarefa.getDataFinalizacao()));
    		 ps.setString(3,tarefa.getLink());
    		 ps.setString(4,tarefa.getFinalizada().toString());
    		 ps.execute();
    		 ps.close();
    	 }catch (SQLException e) {
    		 e.printStackTrace();
		}
     }
	
     public void alterar(Tarefa tarefa) {
    	 sql = "update tarefa_empresa set descricao = ?,data_finalizacao = ?,link_acesso= ?,finalizada=?  where id=?";
    	 try(Connection conn = conexao.conectar()){
    		 ps = conn.prepareStatement(sql);
    		 ps.setString(1,tarefa.getDescricao());
    		 ps.setDate(2,Date.valueOf(tarefa.getDataFinalizacao()));
    		 ps.setString(3,tarefa.getLink());
    		 ps.setBoolean(4,tarefa.getFinalizada());
    		 ps.execute();
    		 ps.close();
    	 }catch (SQLException e) {
    		 e.printStackTrace();
		}
     }
     
     public void remover(int id) {
    	 sql = "delete tarefa_empresa where id=?";
    	 try(Connection conn = conexao.conectar()){
    		 ps = conn.prepareStatement(sql);
    		 ps.setInt(1,id);
    		 ps.execute();
    		 ps.close();
    	 }catch (SQLException e) {
    		 e.printStackTrace();
		}
     }
     
     public List<Tarefa> pesquisarTarefasFinalizadas(boolean finalizado) {
    	 sql = "select * from tarefa_empresa where finalizado=? order by id";
    	 List<Tarefa> tarefasFinalizadas  = new ArrayList<Tarefa>();
    	 try(Connection conn = conexao.conectar()){
    		 ps = conn.prepareStatement(sql);
    		 ps.setBoolean(1,finalizado);
    		 rs = ps.executeQuery();
    		 while(rs.next()) {  
    			 int id = rs.getInt("id");
    			 String descricao = rs.getString("descricao");
    			 Date dataFinalizacao= (rs.getDate("data_finalizacao")); 
    			 String link = rs.getString("link_acesso");
    			 Boolean finalizada = rs.getBoolean("finalizada");
    			 Tarefa tarefa = new Tarefa(id,descricao,dataFinalizacao.toLocalDate(), link, finalizada);
    			 tarefasFinalizadas.add(tarefa);
    		 }
    		 ps.close();
    		 rs.close();
    	 }catch (SQLException e) {
    		 e.printStackTrace();
		 }
    	 return tarefasFinalizadas;
     }
     public List<Tarefa> pesquisarTodasTarefas() {
    	 sql = "select * from tarefa_empresa order by id";
    	 List<Tarefa> tarefas= new ArrayList<Tarefa>();
    	 try(Connection conn = conexao.conectar()){
    		 ps = conn.prepareStatement(sql);
    		 rs = ps.executeQuery();
    		 while(rs.next()) {    
    			 int id = rs.getInt("id");
    			 String descricao = rs.getString("descricao");
    			 Date dataFinalizacao= (rs.getDate("data_finalizacao")); 
    			 String link = rs.getString("link_acesso");
    			 Boolean finalizada = rs.getBoolean("finalizada");
    			 Tarefa tarefa = new Tarefa(id,descricao,dataFinalizacao.toLocalDate(), link, finalizada);
    			 tarefas.add(tarefa);
    		 }
    		 ps.close();
    		 rs.close();
    	 }catch (SQLException e) {
    		 e.printStackTrace();
		 }
    	
    	 return tarefas;
     }
     
}
