<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./css/Style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Quiz</title> 
<!-- Arquivo CSS do menu -->
<link rel="stylesheet" href="./css/menu.css">

<style>
		.botao{
			width: 120px;
			
		}
</style>

</head>
<body>

<%	// Verifica se o usuário está logado
	if(session.getAttribute("logged")!= null){
		response.setHeader("Pragma", "No-cache");			
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
		session.removeAttribute("servico");
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

<!-- Elemento que abre o menu, pode usar qualquer outro -->
<span onclick="abrirMenu()" class="menuBar">Menu</span>
<br><br>

<h1>SmartReview</h1><br><br><br>
<h2><font face = "Times New Roman" size = "6" color="white">Quiz Personalizado</h2>
<form action="Quiz" method="get">
	
	<div id="escolha">
	<select name="area" class="area">
		<option value="" ><font face = "Times New Roman" size = "4" color="#7A8893">Escolha a área:</option>
		<option value="LGT">Linguagens, Códigos e suas Tecnologias</option>
		<option value= "CH">Ciências Humanas e suas Tecnologias</option>
		<option value="CN">Ciências da Natureza e suas Tecnologias</option>
		<option value="MAT">Matemática e suas Tecnologias</option>
	</select><br>
	 
	<select name="qtdQst" class="area">
		<option value="" ><font face = "Times New Roman" size = "4" color="#7A8893">Escolha a quantidade de questões: </option>
		<option value="2">2</option>
		<option value= "4">4</option>
		<option value="5">5</option>
	</select><br><br>
	</div>
	<% session.setAttribute("sem resposta", null); %>
	<input type="submit" class="botao" value="Começar">
</form>

<div id="msgErro">
<%out.println(session.getAttribute("msg")!=null?session.getAttribute("msg"):"");%> <!-- Mensagem de erro -->
<!-- Deixe no fim do body -->
<%session.removeAttribute("msg");%> 
</div>
</body>
</html>