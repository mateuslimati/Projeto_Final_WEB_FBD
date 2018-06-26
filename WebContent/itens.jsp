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

    <title>Itens</title>

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
		      <a class="nav-link" href="#">Itens</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="alugueis.jsp">Alugueis</a>
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
      	 	<h1 class="my-4">Itens</h1>
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
	          <a class="nav-link" href="#" data-toggle="modal" data-target="#cadastrar">Cadastrar</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#" data-toggle="modal" data-target="#deletar">Deletar</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#" data-toggle="modal" data-target="#editar">Editar</a>
	        </li>
	      </ul>
	      <hr class="d-sm-none">
	    </div>
    	<div class="col-sm-9">
		<div class="list-group" id="itens">
			<%ItemDAO cd = new ItemDAO();%>
			<%List<Item> c = cd.getAlugueis();%>
			<div class="row">
			<%int i = 0;%>
			<%for (Item a : c){%>
			<%	String nome = a.getNome(); %>
			  <div class="card" style="width:200px">
			    <img class="card-img-top" src="item.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detalhes<%=i%>"><%=nome%></button>
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
	  	<h4 class="modal-title">Cadastre um Novo Item</h4>
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
      <div class="modal-body">
        <form action="CadastrarItem" method="POST">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="InputNome">Nome</label>
                <input class="form-control" id="nome" type="text" name="nome" aria-describedby="nameHelp" placeholder="Digite o nome do item">
              </div>
              <div class="col-md-6">
                <label for="InputEmail">Descrição</label>
                <input class="form-control" id="descricao" type="text" name="descricao" aria-describedby="nameHelp" placeholder="Insira a descrição do item">
              </div>
            </div>

            <div class="form-row">
              <div class="col-md-6">
                <label for="InputSenha">Preço</label>
                <input class="form-control" id="preco" type="number" name="preco" aria-describedby="nameHelp" placeholder="Insira o preço do item">
              </div>
              <div class="col-md-6">
                <label for="InputReSenha">Quantidade</label>
                <input class="form-control" id="quantidade" type="number" name="quantidade" aria-describedby="nameHelp" placeholder="Insira a quantidade de itens">
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
	  	<h4 class="modal-title">Deletar Item</h4>
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
      <div class="modal-body">
        <form action="DeletarItem" method="POST">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="InputName">Nome</label>
                <input class="form-control" id="nome" type="text" name="nome" aria-describedby="nameHelp" placeholder="Digite o nome do item">
              </div>
            </div>
          </div>
          <input type="submit" value="Deletar" id="validate" class="btn-primary btn-block">
        </form>
      </div>
      </div>
      
    </div>
  </div>

  <!-- Modal Editar -->
  <div class="modal fade" id="editar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
	  <div class="modal-header">
	  	<h4 class="modal-title">Editar o valor do produto</h4>
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
      <div class="modal-body">
        <form action="EditarValor" method="POST">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="InputNome">Nome</label>
                <input class="form-control" id="nome" type="text" name="nome" aria-describedby="nameHelp" placeholder="Digite o nome do produto">
              </div>
              <div class="col-md-12">
                <label for="InputSenha">Novo Valor</label>
                <input class="form-control" id="valor" type="number" name="valor" aria-describedby="nameHelp" placeholder="Digite o novo valor">
              </div>
            </div>
          </div>
          <input type="submit" value="Editar" id="validate" class="btn-primary btn-block">
        </form>
      </div>
      </div>
      
    </div>
  </div>

  <%i = 0;%>
  <%for(Item a : c){ %>
  <!-- Modal Detalhes -->
  <div class="modal fade" id="detalhes<%=i%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
	  	<div class="modal-header">
	  		<h4 class="modal-title"><%=a.getNome()%></h4>
	    	<button type="button" class="close" data-dismiss="modal">&times;</button>
	  	</div>
      	<div class="modal-body">
			<table class="table">
		    	<tbody>
		      		<tr>
				        <td><h5>Descrição</h5></td>
				        <td><%=a.getDescricao()%></td>
		      		</tr>
		      		<tr>
		        		<td><h5>Preço</h5></td>
		        		<td>R$ <%=a.getPreco()%></td>
		      		</tr>
		      		<tr>
		        		<td><h5>Quantidade</h5></td>
		        		<td><%=a.getQuantidade()%></td>
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
