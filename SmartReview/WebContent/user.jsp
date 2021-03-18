<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.dao.LoginDao, com.dao.ConnectBD"%>
<!DOCTYPE html>
<html>
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<title>Página de Usuário</title> 
	
	<!-- Arquivo CSS do menu -->
	<link rel="stylesheet" href="./css/menu.css">
	<link rel="stylesheet" href="./css/Style.css">
	
	
	
	
	<style>
	
		h1{ 
		background-color:white;
		width: 390px;
		border-radius: 10px;
		box-shadow: 5px 5px 15px #041526;
		face: Times New Roman ;
		font-size: 46px ;
		color: #223D58;
		box-shadow: 5px 5px 15px #010e1b5e;
		top:50x;
	}
			.menuBar{
		color: white;
		text-align: right;
		height:15px;
    	float: right;
   		margin-right:auto;
   		margin-left: auto;
    	padding-left:0.5%;
    	background-color: black;
    	box-shadow: 1px 1px 2px  #7A8893;
    	cursor: pointer;
    	width: 50px;
    	border-radius: 10px;
    	position: absolute;
		top: 50px;
		right: -50px;	
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
		
	<!-- Menu de canto -->
	<div id="menuCanto" class="menucanto">
	  <a href="javascript:void(0)" class="fecharbtn" onclick="fecharMenu()">&times;</a>
	  <a href="/SmartReview/inicio.jsp">Inicio</a>
	  <a href="/SmartReview/user.jsp">Usuário</a>
	  <a href="/SmartReview/simulado.jsp">Simulado</a>
	  <a href="/SmartReview/quiz.jsp">Quiz</a>
	  <a href="/SmartReview/logout">Sair</a>
	</div>
	
	<h1>Smartreview</h1>
	<!-- Elemento que abre o menu, pode usar qualquer outro mas, mantenha a função quando o elemento for clicado -->
	<span onclick="abrirMenu()" class="menuBar">Menu</span>
	<br><br>
	
	<!--  Página de Usuário-->
	<br>
	<!-- Foto do usuário -->
	<!-- Mostrando foto na página -->
	<img src="imguser" width="100" height="100">
	
	<!-- Upload da foto -->
	<label for="upload">
		<img src="./css/alterararFoto.png" width="20" height="10">
	</label>
	
	<form action="imguser" method="post" enctype="multipart/form-data">
	
		<div style="display: none;">
			<input type="file" name="foto" required="required" id="upload" accept=".jpg, .jpeg, .png" oninput="confirmar">
			<input type="submit" id="confirm">
		</div>
		
	</form>
	<br>
	
	<!-- Alteração dos dados do usuário -->
	<!-- "Botão" -->
	<span onclick="alterarDados()" class="altDados">
		<img src="./css/edicao.png" width="20" height="10">
	</span>
	<br>
	
	<!-- Formulario de alteração dos dados -->
	<div id="AltDados" style="display: none;">
	
		<form action="login" method=get>
	
			<input type="text" name="username" maxlength="15" size="20" placeholder="@Usuário:"
				value=<%=LoginDao.get("usuario", "cadastro",  "IDcadastro",session.getAttribute("logged"))%>><br>
			<input type="text" name="name" maxlength="230" size="20" placeholder="Nome:"
				value=<%=LoginDao.get("nome", "cadastro",  "IDcadastro",session.getAttribute("logged"))%>><br>
			<input type="text" name="email" maxlength="320" size="20" placeholder="Email:"
				value=<%=LoginDao.get("email", "cadastro",  "IDcadastro",session.getAttribute("logged"))%>><br>
			<input type="text" name="uf" maxlength="2" size="20" placeholder="UF:"
				value=<%=LoginDao.get("uf", "cadastro",  "IDcadastro",session.getAttribute("logged"))==null?"":
				LoginDao.get("uf", "cadastro",  "IDcadastro",session.getAttribute("logged"))%>><br>
			<input type="text" name="cidade" maxlength="20" size="20" placeholder="Cidade:"
				value=<%=LoginDao.get("cidade", "cadastro",  "IDcadastro",session.getAttribute("logged"))==null?"":
				LoginDao.get("cidade", "cadastro",  "IDcadastro",session.getAttribute("logged"))%>><br>
			
			<input type="submit" class="botao" value="Alterar">
	
		</form>
	</div>
	
	<!-- Dados do usuário -->
	<div id="VisDados">
		Usuario: @<%=LoginDao.get("usuario", "cadastro", "IDcadastro",session.getAttribute("logged"))%><br>
		Nome:<%=LoginDao.get("nome", "cadastro",  "IDcadastro",session.getAttribute("logged"))%><br>
		Email:<%=LoginDao.get("email", "cadastro",  "IDcadastro",session.getAttribute("logged"))%><br>
		UF:<%=LoginDao.get("uf", "cadastro",  "IDcadastro",session.getAttribute("logged"))==null?"":
			LoginDao.get("uf", "cadastro",  "IDcadastro",session.getAttribute("logged"))%><br>
		Cidade:<%=LoginDao.get("cidade", "cadastro",  "IDcadastro",session.getAttribute("logged"))==null?"":
			LoginDao.get("cidade", "cadastro",  "IDcadastro",session.getAttribute("logged"))%><br>
	</div>
	
	<%out.println(session.getAttribute("msg")!=null?session.getAttribute("msg"):"");%> <!-- Mensagem de erro -->
	
	<!-- Gráfico -->
	<img src="graphic" width="600" height="400">
	
	<!-- Script do menu -->
	<script src="./js/menu.js"></script>
	<script src="./js/usuario.js"></script>

	<!-- Deixe no fim do body -->
	<%session.removeAttribute("msg");%> 
</body>
</html>