<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Simulado</title> 
<!-- Arquivo CSS do menu -->
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/Style.css">



<style>
		.botao{
			display: block;
		}
		
		h1{ 
		background-color:white;
		width: 400px;
		border-radius: 10px;
		box-shadow: 5px 5px 15px #041526;
		face: Times New Roman ;
		font-size: 46px ;
		color: #223D58;
		box-shadow: 5px 5px 15px #010e1b5e;
		top:50x;
		}
		
</style>

</head>
<body>

<%	// Verifica se o usuário está logado
	if(session.getAttribute("logged")!= null){
		response.setHeader("Pragma", "No-cache");			
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
	}else response.sendRedirect("inicial.jsp");
%>

<!-- Script do menu -->
<script src="./js/menu.js"></script>

<!-- Menu de canto -->
<div id="menuCanto" class="menucanto">
  <a href="javascript:void(0)" class="fecharbtn" onclick="fecharMenu()">&times;</a>
  <a href="/SmartReview/inicio.jsp">Inicio</a>
  <a href="/SmartReview/user.jsp">Usuário</a>
  <a href="/SmartReview/simulado.jsp">Simulado</a>
  <a href="/SmartReview/quiz.jsp">Quiz</a>
  <a href="/SmartReview/logout">Sair</a>
</div>

<h1>SmartReview</h1><br><br>

<!-- Elemento que abre o menu, pode usar qualquer outro -->
<span onclick="abrirMenu()" class="menuBar">Menu</span>
<br><br><br>


<h2>Simulado</h2><br>

<%session.setAttribute("servico", "simulado");%>
<a href="/SmartReview/questoesSimulado.jsp"><input type="submit" class="botao" value="Começar"></a>

</body>
</html>