<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.model.Questao, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Simulado</title> 
<!-- Arquivo CSS do menu -->
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/Style.css">

</head>
<body>
	
	<%	// Verifica se o usuário está logado	
		response.setHeader("Pragma", "No-cache");			
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
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
	
	<form action="CorrecaoQuestao" method=post>
	
		Questões<br><br>
		<% 
			if(session.getAttribute("servico") == "simulado" && session.getAttribute("logged") != null){
				
				response.setHeader("Pragma", "No-cache");			
				response.setHeader("Cache-Control", "no-store");
				response.setDateHeader("Expires", 0);
				
				ArrayList<Questao> qsts = Questao.gerarQstsSim();
				session.setAttribute("qsts", qsts);
				
				for(Questao qst : qsts){
					int i = qsts.indexOf(qst)+1;
					
					System.out.println(i+")"+qst.getID()); 
					out.print(i+")");
					out.println(qst.getEnunciado() + "<br><br>" );
					
					out.println("A)<input id='A"+i+"' type='radio' name='questao"+i+"' value='a'><label for='A"+i+"'>" +  qst.getAlt(0).getTexto()+"</label><br>");
					out.println("B)<input id='B"+i+"' type='radio' name='questao"+i+"' value='b'><label for='B"+i+"'>" +  qst.getAlt(1).getTexto()+"</label><br>");
					out.println("C)<input id='C"+i+"' type='radio' name='questao"+i+"' value='c'><label for='C"+i+"'>" +  qst.getAlt(2).getTexto()+"</label><br>");
					out.println("D)<input id='D"+i+"' type='radio' name='questao"+i+"' value='d'><label for='D"+i+"'>" +  qst.getAlt(3).getTexto()+"</label><br>");
					out.println("E)<input id='E"+i+"' type='radio' name='questao"+i+"' value='e'><label for='E"+i+"'>" +  qst.getAlt(4).getTexto()+"</label><br><br>");
				}
			}
			else
				response.sendRedirect("simulado.jsp");
		%>
		
		<input type="submit" value="Terminar">
	</form>

	</body>
</html>