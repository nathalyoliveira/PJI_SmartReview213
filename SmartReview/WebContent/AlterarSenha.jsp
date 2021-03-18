<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./css/Style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Esqueceu a senha</title>

<style>
		.botao{
		border-radius: 10px;
		background-color: #06203b;
		color: white;
		width: 250px;
		height: 40px;
		cursor: pointer;
		text-align: center;
		font-size: 17px;
		height: auto;
		box-shadow: 2px 2px 3px  black;
		border-color: #06203b;
		}
</style>

</head>
<body>

<h1>SmartReview</h1><br><br><br><br><br><br><br>
<h2>Informe o email</h2><br><br>
<form action="AlterarSenha" method=post>
	<textarea name="email" cols="20" rows="1" maxlength=320 placeholder="Email"></textarea><br>
	
	<div id="msgErro">
<%out.println(session.getAttribute("msg")!=null?session.getAttribute("msg"):"");%> <!-- Mensagem de erro -->
<!-- Deixe no fim do body -->
<%session.removeAttribute("msg");%> 
</div>
	
	<br><br><br><br><input type="submit" class="botao" value="Enviar email de confirmação">
</form>


</body>
</html>