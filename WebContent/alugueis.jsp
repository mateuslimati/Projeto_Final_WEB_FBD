<%@page import="model.Cliente"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="DAO.AluguelDAO"%>
<%@page import="model.Aluguel"%>
<%@page import="model.Item"%>
<%@page import="DAO.ItemDAO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Alugueis</title>

 	<link rel="icon" href="MeuDiretorio/MeuIcone.ico" type="image/x-icon" />

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/2-col-portfolio.css" rel="stylesheet">
    
    <style>
    	div.list-group{
    		margin-bottom: 30px;
    	}
    	.card{
    		margin-right: 15px;
    		margin-bottom: 15px;
    	}
    	.margin-down{
    		margin-top: 30px;
    	}
    	h6{
    		margin-top: 15px;
    	}
    	button{
    		margin-bottom: 10px;
    	}
    </style>
    

  </head>

  <body>
  
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  		<a class="navbar-brand" href="#">Pathy Eventos</a>
  		<ul class="navbar-nav">
    		<li class="nav-item">
      			<a class="nav-link" href="itens.jsp">Itens</a>
    		</li>
    		<li class="nav-item">
		      	<a class="nav-link" href="#">Alugueis</a>
    		</li>
		    <li class="nav-item">
      			<a class="nav-link" href="index.jsp">Clientes</a>
		    </li>
  		</ul>
	</nav>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <div class="row">
      	 <div class="col-md">
      	 	<h1 class="my-4">Alugueis</h1>
      	 </div>
      	 <div class="col-md-4">
			  <form class="form-inline margin-down">
			    <div class="input-group">
			      <input type="text" id="search" class="form-control" placeholder="Username">
			      <div class="input-group-prepend">
			        <span class="input-group-text">@</span>
			      </div>
			    </div>
			  </form>
		 </div>
      </div>
      <div class="row">
	    <div class="col-sm-3">
	      <ul class="nav nav-pills flex-column">
	        <li class="nav-item">
	          <a class="nav-link" href="#" data-toggle="modal" data-target="#cadastrar">Registrar</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#" data-toggle="modal" data-target="#deletar">Deletar</a>
	        </li>
	      </ul>
	      <hr class="d-sm-none">
	    </div>
    	<div class="col-sm-9">
		<div class="list-group" id="itens">
			<%AluguelDAO cd = new AluguelDAO();%>
			<%List<Aluguel> c = cd.getAlugueis();%>
			<div class="row">
			<%int i = 0;%>
			<%for (Aluguel a : c){%>
			<%	int id = a.getId(); %>
			  <div class="card" style="width:200px">
			    <img class="card-img-top" src="aluguel.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detalhes<%=i%>">Id <%=id%></button>
			    </div>
			  </div>
			<% i++;%>  
		  	<%}%>
		  	</div>
		</div>
		</div> 
		</div>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <div class="jumbotron text-center py-5 bg-dark" style="margin-bottom:0">
  		<p class="m-0 text-center text-white">Copyright © Your Website 2018</p>
	</div>

  <!-- Modal Cadastrar -->
  <div class="modal fade" id="cadastrar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
	  <div class="modal-header">
	  	<h4 class="modal-title">Registrar um Aluguel</h4>
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
      <div class="modal-body">
        <form action="CadastrarAluguel" method="POST">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="InputNome">Email do Cliente</label>
                <input class="form-control" id="nome" type="text" name="email" aria-describedby="nameHelp" placeholder="Digite o email do cliente">
              </div>
              <div class="col-md-12">
                <label for="InputEmail">Digite o nome do Item</label>
                <input class="form-control" id="item" type="text" name="nome" aria-describedby="nameHelp" placeholder="Digite o nome do item">
              </div>
              <div class="col-md-12">
                <label for="InputData">Digite a data do Aluguel</label>
                <input class="form-control" id="data" type="date" name="data" aria-describedby="nameHelp" placeholder="Digite a data do aluguel">
              </div>
            </div>
			<h6><span class="badge badge-danger" id="result"></span></h6>
          </div>
          <input type="submit" value="Cadastrar" id="validate" class="btn-primary btn-block"></input>
        </form>
      </div>
      </div>
            
    </div>
  </div>
  
  <!-- Modal Deletar -->
  <div class="modal fade" id="deletar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
	  <div class="modal-header">
	  	<h4 class="modal-title">Deletar Registro de Aluguel</h4>
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
      <div class="modal-body">
        <form action="DeletarAluguel" method="POST">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="InputName">ID</label>
                <input class="form-control" id="nome" type="number" name="id" aria-describedby="nameHelp" placeholder="Digite o ID do Registro a ser deletado">
              </div>
            </div>
          </div>
          <input type="submit" value="Deletar" id="validate" class="btn-primary btn-block">
        </form>
      </div>
      </div>
      
    </div>
  </div>

  <%ClienteDAO cliDAO = new ClienteDAO();%>
  <%ItemDAO itemDAO = new ItemDAO();%>
  <%i = 0;%>
  <%for(Aluguel a : c){ %>
  <!-- Modal Detalhes -->
  <div class="modal fade" id="detalhes<%=i%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
	  	<div class="modal-header">
	  		<h4 class="modal-title">Id do Aluguel - <%=a.getId()%></h4>
	    	<button type="button" class="close" data-dismiss="modal">&times;</button>
	  	</div>
      	<div class="modal-body">
			<table class="table">
		    	<tbody>
		      		<tr>
				        <td><h5>Cliente</h5></td>
				        <td><%=cliDAO.getById(a.getId_cli()).getNome()%></td>
		      		</tr>
		      		<tr>
		        		<td><h5>Item</h5></td>
		        		<td><%=itemDAO.getById(a.getId_item()).getNome()%></td>
		      		</tr>
		      		<tr>
		        		<td><h5>Data de Aluguel</h5></td>
		        		<td><%=a.getData_aluguel()%></td>
		      		</tr>
		      		<%if(a.getData_devolucao() == null){%>
		      		<tr>
		        		<td><h5>Data de Devolução</h5></td>
		        		<td></td>
		      		</tr>
		      		<%}else{ %>
		      		<tr>
		        		<td><h5>Data de Devolução</h5></td>
		        		<td><%=a.getData_devolucao()%></td>
		      		</tr>
		      		<%} %>
		      		<tr>
		        		<td><h5>Preço do Item</h5></td>
		        		<td>R$ <%=itemDAO.getById(a.getId_item()).getPreco()%></td>
		      		</tr>
		    	</tbody>
			</table>
			
		</div>
	</div>
      
    </div>
  </div>
  <%i++;%>
  <%} %>	

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
		$(document).ready(function(){
		  $("#search").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#itens div").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>
  </body>	

</html>
