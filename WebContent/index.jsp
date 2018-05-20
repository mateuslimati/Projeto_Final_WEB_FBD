<%@page import="model.Cliente"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Clientes</title>

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
    </style>
    

  </head>

  <body>
  
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  		<a class="navbar-brand" href="#">Pathy Eventos</a>
  		<ul class="navbar-nav">
    		<li class="nav-item">
      			<a class="nav-link" href="#">Alugueis</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="#">Eventos</a>
    		</li>
    		    <!-- Dropdown -->
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		        Clientes
		      </a>
		      <div class="dropdown-menu">
		        <a class="dropdown-item " href="#" data-toggle="modal" data-target="#cadastrar">Cadastrar</a>
		        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#deletar">Deletar</a>
		        <a class="dropdown-item" href="#">Editar</a>
		      </div>
		    </li>
  		</ul>
	</nav>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <div class="row">
      	 <div class="col-md">
      	 	<h1 class="my-4">Clientes</h1>
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

		<div class="list-group" id="clientes">
			<%ClienteDAO cd = new ClienteDAO();%>
			<%List<Cliente> c = cd.getClientes();%>
			<div class="row">
			<%int i = 0;%>
			<%for (Cliente a : c){%>
			<%	String nome = a.getNome(); %>
			<%	String email = a.getEmail(); %>
			<%	String senha = a.getSenha(); %>
			  <div class="card" style="width:200px">
			    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detalhes<%=i%>"><%=nome%></button>
			    </div>
			  </div>
			<% i++;%>  
		  	<%}%>
		  	</div>
		</div> 
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

  <!-- Modal Cadastrar -->
  <div class="modal fade" id="cadastrar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
	  <div class="modal-header">
	  	<h4 class="modal-title">Cadastre um novo cliente</h4>
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
      <div class="modal-body">
        <form action="CadastrarCliente" method="POST">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="InputNome">Nome</label>
                <input class="form-control" id="InputNome" type="text" name="nome" aria-describedby="nameHelp" placeholder="Digite o nome do cliente">
              </div>
              <div class="col-md-6">
                <label for="InputEmail">Email</label>
                <input class="form-control" id="email" type="text" name="email" aria-describedby="nameHelp" placeholder="Cadastre o email do cliente">
              </div>
            </div>

            <div class="form-row">
              <div class="col-md-6">
                <label for="InputSenha">Senha</label>
                <input class="form-control" id="InputSenha" type="password" name="senha" aria-describedby="nameHelp" placeholder="Cadastre a senha">
              </div>
              <div class="col-md-6">
                <label for="InputReSenha">Confirmação de Senha</label>
                <input class="form-control" id="InputReSenha" type="password" name="reSenha" aria-describedby="nameHelp" placeholder="Confirme a senha">
              </div>
            </div>
			<h6><span class="badge badge-danger" id="result"></span></h6>
          </div>
          <input type="submit" value="Registrar" id="validate" class="btn-primary btn-block"></input>
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
	  	<h4 class="modal-title">Deletar cliente</h4>
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
      <div class="modal-body">
        <form action="DeletarCliente" method="POST">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="InputEmail">Email</label>
                <input class="form-control" id="email" type="text" name="email" aria-describedby="nameHelp" placeholder="Digite o email do cliente">
              </div>
            </div>
          </div>
          <input type="submit" value="Deletar" id="validate" class="btn-primary btn-block">
        </form>
      </div>
      </div>
      
    </div>
  </div>
  

  <%i = 0;%>
  <%for(Cliente a : c){ %>
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
				        <td><h5>Email</h5></td>
				        <td><%=a.getEmail()%></td>
		      		</tr>
		      		<tr>
		        		<td><h5>Endereço</h5></td>
		        		<td><%=a.getEndereco()%></td>
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
		    $("#clientes div").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>
	<script>
		function validateEmail(email) {
			  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			  return re.test(email);
			}
	
			function validate() {
			  var $result = $("#result");
			  var email = $("#email").val();
			  $result.text("");
	
			  if (validateEmail(email)) {
				  return true;
			  } else {
			    $result.text("Email Inválido!");
			  }
			  return false;
			}
	
			$("#validate").bind("click", validate);
	</script>
  </body>

</html>
