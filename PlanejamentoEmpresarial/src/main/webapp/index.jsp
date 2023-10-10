<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="model.dao.TarefaDAO"%>
<%@page import="model.entidades.Tarefa"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%List<Tarefa> tarefas = new TarefaDAO().pesquisarTodasTarefas();%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agenda</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css">
</head>

<body>
	<main>
        <h1 class="text-center">Organização da empresa</h1>
        <div class="d-flex justify-content-center gap-3 p-2">
	        <button class="btn btn-success open-btn" id="btn-adicionar"
                        name="btn-adicionar">Adicionar tarefa</button>
                    <button class="btn btn-primary open-btn" id="btn-filtrar" name="btn-filtrar">Filtrar</button>
        </div>
		<table class="table">
			<thead class="table-dark">
				<tr>
					<th>Descrição</th>
					<th>Data de Finalização da tarefa</th>
					<th>Link para acessar a tarefa</th>
					<th>Finalizada</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Tarefa tarefa : tarefas) {
				%>
				<tr>
					<th><%=tarefa.getDescricao()%></th>
					<th><%=tarefa.getDataFormatada()%></th>
					<th><a href="<%=tarefa.getLink()%>" target="_blank"><%=tarefa.getLink()%></a></th>
					<% 
					String terminada = ""; 
					if(tarefa.getFinalizada())
						terminada = "SIM";
					else
						terminada = "NÃO";
					%>
				    <th><%=terminada%></th>
					<th>
						<a href="alteracao.jsp?id_alteracao=<%=tarefa.getId()%>">
						<button class="open-btn btn-alterar btn btn-warning " id=""
							name="btn_alterar">Alterar</button>																													
						</a>
					</th>
					<th>
					    <form action="./tarefa" method="post">
					    <input  type="hidden" value="<%=tarefa.getId()%>" name= "id">
					    <input type="hidden" value="<%="remover"%>" name= "acao">
						<button class="btn btn-danger" id="btn_remover" name="btn_remover">Remover</button>						
					    </form>
					</th>
				</tr>
				<%}%>
			</tbody>
		
		</table>

		<div class="pop-up p-2 none" id="pop-up">
			<form action="./tarefa" class="d-flex flex-column gap-3 p-3 bg-success rounded" method="post">
				<div class="d-flex justify-content-start">
					<span class="btn text-light fs-4" id="btn-fechar">X</span>
				</div>
				<h2 class="m-3">Adicionar tarefa:</h2>
			    <input type="hidden" value="adicionar" name="acao">
				<fieldset class="">
					<label for="">Descrição da tarefa</label>
					<textarea class="form-control" id="floatingTextarea" name="descricao"></textarea>
				</fieldset>
				<fieldset>
					<label for="" class="mb-1">Data de finalização</label> <br> <input
						type="date" name="dataFinalizacao">
				</fieldset>
				<fieldset>
					<legend class="mb-1 fs-5">Finalizada?</legend> <br>
                    <label for="">Sim</label>
					<input type="radio" value="true" name="finalizada" class ="finalizada">
                    <label for="">Não</label>
                    <input type="radio" value="false" name="finalizada" class ="finalizada">
				</fieldset>
				<fieldset class="">
					<label for="" class="mb-1">Link para acessar o arquivo:</label> <br>
					<input type="text" value="Nenhum" name="link">
				</fieldset>
				<div class="d-flex justify-content-center">
					<button class=" col-6 btn btn-primary  align-itens-center">Adicionar</button>
				</div>
			</form>
		</div>
		
		<div class="pop-up p-2 none" id="pop-up-filtro">
			<form action="" class="d-flex flex-column gap-3 p-3 bg-primary rounded">
				<div class="d-flex justify-content-start">
					<span class="btn text-light fs-4" id="btn-filtro-fechar">X</span>
				</div>
				<h2 class="m-3">Filtro:</h2>
				<fieldset>
					<legend for="" class="mb-1 fs-5 text-center">Finalizada?</legend>
                    <div class="d-flex justify-content-center p-1">
                    <label for="">Sim</label>
					<input type="radio" value="true" name="finalizado">                    
                    </div>
                    <div class="d-flex justify-content-center p-1">
                    <label for="" class="">Não</label>
                    <input type="radio" value="false" name="finalizado">                    
                    </div>
				</fieldset>
				<div class="d-flex justify-content-center">
					<button class=" col-6 btn btn-success  align-itens-center">Filtrar</button>
				</div>
			</form>
		</div>
			
	</main>
	<script src="js/dom.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>

</html>