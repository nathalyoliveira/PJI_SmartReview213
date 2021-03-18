<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Página de Login</title> 
<!-- Arquivo CSS do menu -->
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/Style.css">



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

<h1>SmartReview</h1><br><br>
<h2>Familiarizando-se com o ambiente</h2><br>

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

<!-- Elemento que abre o menu, pode usar qualquer outro mas, mantenha a função quando o elemento for clicado -->
<span onclick="abrirMenu()" class="menuBar">Menu</span>
<br><br>

<!-- Página inicial --><br>
<div id="paginaInicial">
<p>Aqui você poderá conferir seus dados pessoais, além de consultar seu desempenho nas atividades...</p>
<a href="/SmartReview/user.jsp" class="botao" >Usuário</a><br><br><hr>
<p>Este é o simulado, com perguntas aleatórias pré-definidas...</p>
<a href="/SmartReview/simulado.jsp" class="botao">Simulado</a><br><br><hr>
<p>Realize um quiz rápido e personalizado para testar seus conhecimentos...</p>
<a href="/SmartReview/quiz.jsp" class="botao">Quiz</a><br><br><hr>
</div>
</body>
</html>