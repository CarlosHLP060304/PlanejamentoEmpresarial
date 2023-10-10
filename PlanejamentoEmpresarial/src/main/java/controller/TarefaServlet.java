package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TarefaDAO;
import model.entidades.Tarefa;

@WebServlet("/tarefa")
public class TarefaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String acao = request.getParameter("acao");
		switch(acao) {
			case "adicionar","alterar":
				String descricao = request.getParameter("descricao");
				String link = request.getParameter("link");
				boolean finalizada = Boolean.parseBoolean(request.getParameter("finalizada"));
				LocalDate dataInicio = LocalDate.parse(request.getParameter("dataInicio"));
				LocalDate dataFinalizacao = LocalDate.parse(request.getParameter("dataFinalizacao"));
				Tarefa tarefa = new Tarefa(descricao,dataInicio,dataFinalizacao, link,finalizada);
				if(acao.equals("adicionar")) {
					new TarefaDAO().inserir(tarefa);					
				}
				else if(acao.equals("alterar")) {
					int id = Integer.parseInt(request.getParameter("id_alteracao"));
					tarefa.setId(id);
					new TarefaDAO().alterar(tarefa);					
				}
				 response.sendRedirect("index.jsp");
				 break;
			case "remover":
				Integer id = Integer.parseInt(request.getParameter("id"));
				new TarefaDAO().remover(id);
				response.sendRedirect("index.jsp");
				break;
		}
		
	}

}
