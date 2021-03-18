<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang = "pt-br">
<head>

<link rel="stylesheet" href="./css/Style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<title>Página Inicial</title>

<style>
	a{
		color: #7A8893;
		text-align: right;
		right: 400px;
		display: block;
		height: auto;
		padding: 15px;
	}
</style>
</head>
<body>
<h1>SmartReview</h1><br><br><br><br><br><br>
<h2>Login</h2><br><br>

<%	// Verifica se o usuário já está logado
	if(session.getAttribute("logged")!= null){
		response.sendRedirect("user.jsp");
	}
%>

<form action="login" method=post>
	<textarea name="email" cols="20" rows="1" maxlength=320 placeholder="Email"></textarea><br>
	<input type="password" name="passwd" placeholder="Senha">
	
	<a href="/SmartReview/AlterarSenha.jsp">Esqueceu a senha?</a>
	
	<br><div id="msgErro">
	<%out.println(session.getAttribute("msg")!=null?session.getAttribute("msg"):"");%> <!-- Mensagem de erro -->
	<!-- Deixe no fim do body -->
	<%session.removeAttribute("msg");%> 
	</div>
	
	<br><input type="submit" class="botao" value="Entrar"><br>
</form>
<form action="/SmartReview/cadastro.jsp" method=post><input type="submit" class="botao" value="Cadastre-se"></form>




</body>
</html>