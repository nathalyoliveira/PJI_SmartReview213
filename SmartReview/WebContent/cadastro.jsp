<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./css/Style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<title>Cadastro</title>
</head>
<body>
<h1>SmartReview<br></h1><br><br><br><br>
<h2>Cadastro</h2><br><br>
<form action="signup" method=post>
	<textarea name="name" cols="20" rows="1" maxlength=230 placeholder="Nome Completo:"></textarea><br>
	<textarea name="username" cols="20" rows="1" maxlength=15 placeholder="Usuário:"></textarea><br>
	<textarea name="email" cols="20" rows="1" maxlength=320 placeholder="Email"></textarea><br>
	<input type="password" name="passwd" placeholder="Senha">
	
	<br><span>
<%out.println(session.getAttribute("msg")!=null?session.getAttribute("msg"):"");%> <!-- Mensagem de erro -->
<!-- Deixe no fim do body -->
<%session.removeAttribute("msg");%> 
</span>
	<br><br>
	<input type="submit" class="botao" value="Cadastrar">
</form>


</body>
</html>