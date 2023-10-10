<%@page import="model.dao.TarefaDAO"%>
<%@page import="model.entidades.Tarefa"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%List<Tarefa> tarefas = new TarefaDAO().pesquisarTodasTarefas();

int id= Integer.parseInt(request.getParameter("id_alteracao"));
int count = 0;
%>
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
					<th>Data de Início</th>
					<th>Data de Finalização da tarefa</th>
					<th>Link para acessar a tarefa</th>
					<th>Dias restantes</th>
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
					<th><%=tarefa.getDataInicioFormatada() %></th>
					<th><%=tarefa.getDataFinalizacaoFormatada()%></th>
					<th><a href="<%=tarefa.getLink()%>" target="_blank"><%=tarefa.getLink()%></a></th>
					<th><%=tarefa.getDataInicio().until(tarefa.getDataFinalizacao())%></th>
					<th><%=tarefa.getFinalizada()%></th>
					<th>
						<button class="open-btn btn-alterar btn btn-warning " id=""
							name="btn_alterar" value="<%=tarefa.getId()%>">Alterar</button>																							
					</th>
					<th>
					    <form action="./tarefa" method="post">
					    <input  type="hidden" value="<%=tarefa.getId()%>" name= "id">
					    <input type="hidden" value="<%="remover"%>" name= "acao">
						<button class="btn btn-danger" id="btn_remover" name="btn_remover">Remover</button>						
					    </form>
					</th>
				</tr>
				<%
				if(tarefa.getId()== id){
					id = count;
				}
				count++;
				%>
				<%}%>
			</tbody>
		
		</table>

		<div class="pop-up p-2" id="pop-up-alterar">
			<form action="./tarefa" class="d-flex flex-column gap-3 p-3 bg-warning rounded" method="post">
				<div class="d-flex justify-content-start">
					<a class="btn text-light fs-4" id="btn-fechar-alteracoes" href="index.jsp">X</a>
				</div>
				<h2 class="m-3">Alterar dados da tarefa:</h2>
			    <input type="hidden" value="alterar" name="acao">
			    <input type="hidden" value = "<%=tarefas.get(id).getId()%>" name="id_alteracao">
				<fieldset class="">
					<label for="">Descrição da tarefa</label>
					<textarea class="form-control" id="descricao" name="descricao"><%=tarefas.get(id).getDescricao()%></textarea>
				</fieldset>
				<fieldset>
					<label for="" class="mb-1">Data de início</label> <br> <input
						type="date" name="dataInicio" value="<%=tarefas.get(id).getDataInicio()%>">
				</fieldset>
				<fieldset>
					<label for="" class="mb-1">Data de finalização</label> <br> <input
						type="date" name="dataFinalizacao" value="<%=tarefas.get(id).getDataFinalizacao()%>">
				</fieldset>
				<fieldset>
					<%boolean finalizada = tarefas.get(id).getFinalizada();
					  String resultados[] = new String [2]; 
					  if(finalizada == true){
						  resultados[0] = "checked";
					  	  resultados[1] = "";}
					 else{
					  	  resultados[0] = "";
   						  resultados[1] = "checked";
					  	  }
					%>
					<legend for="" class="mb-1 fs-5">Finalizada?</legend> <br>
                    <label for="">Sim</label>
					<input type="radio" value="true" name="finalizada" <%=resultados[0]%> id="finalizada1">
                    <label for="">Não</label>
                    <input type="radio" value="false" name="finalizada" <%=resultados[1]%> id="finalizada2">
				</fieldset>
				<fieldset class="">
					<label for="" class="mb-1">Link para acessar o arquivo:</label> <br>
					<input type="text" name="link" value="<%=tarefas.get(id).getLink()%>">
				</fieldset>
				<div class="d-flex justify-content-center">
					<button class=" col-6 btn btn-primary  align-itens-center">Alterar</button>
				</div>
			</form>
		</div>
			
	</main>
	<script src="js/alteracao.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>

</html>