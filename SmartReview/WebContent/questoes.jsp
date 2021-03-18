<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.model.Questao, java.util.ArrayList"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Quiz</title>




<style>
		*{
		width: 380px;
		padding: 7px;
		margin: auto;
	}
	
	body{
		margin: auto;
		background-image: linear-gradient(to bottom, #06203B, #223D58, #47657D, #7090A7);
		background-attachment: fixed;
		
	}
	
	h1{ 
		background-color:white;
		width: 390px;
		border-radius: 10px;
		box-shadow: 5px 5px 15px #041526;
		face: Times New Roman ;
		font-size: 50px ;
		color: #223D58;
		box-shadow: 5px 5px 15px #010e1b5e;
		top:50x;
	}
	
	#alternativas *{
		display: block;
	}
	label{
		color:white;
		text-align: justify;

	}
	div input{
		color:white;
	}
	
	.botao{
		border-radius: 10px;
		background-color: #06203b;
		color: white;
		width: 155px;
		height: auto;
		cursor: pointer;
		text-align: center;
		font-size: 17px;
		box-shadow: 2px 2px 3px  black;
		border-color: #06203b;
		display: block;
	}
</style>




</head>
<body>
	<h1>SmartReview</h1>
	<%	// Verifica se o usuário vai fazer o quiz
		
		if(session.getAttribute("servico") != "quiz" || (Questao) session.getAttribute("qst") == null){
			response.sendRedirect("quiz.jsp");
		}
		else{
			response.setHeader("Pragma", "No-cache");			
			response.setHeader("Cache-Control", "no-store");
			response.setDateHeader("Expires", 0);
			Questao qst = (Questao) session.getAttribute("qst");	
	%>
	<fieldset id="Question">
		<form action="CorrecaoQuestao" method=post>
			<%=session.getAttribute("qtsAtual")%>) Questão - <%=session.getAttribute("area")%><br><br>
			<% if(qst != null) out.print(qst.getEnunciado()); %><br><br>
			<div id="alternativas">
			<font face = "Times New Roman" size = "4" color="white" text-align="ustify">
			A)<input id="A" type="radio" name="questao" value="a"><label for="A"><% if(qst != null) out.print(qst.getAlt(0).getTexto());%></label><br>
			B)<input id="B" type="radio" name="questao" value="b"><label for="B"><% if(qst != null) out.print(qst.getAlt(1).getTexto());%></label><br>
			C)<input id="C" type="radio" name="questao" value="c"><label for="C"><% if(qst != null) out.print(qst.getAlt(2).getTexto());%></label><br>
			D)<input id="D" type="radio" name="questao" value="d"><label for="D"><% if(qst != null) out.print(qst.getAlt(3).getTexto());%></label><br>
			E)<input id="E" type="radio" name="questao" value="e"><label for="E"><% if(qst != null) out.print(qst.getAlt(4).getTexto());%></label><br>
			</div>
			
			<br> <br>
			<%out.println(session.getAttribute("msg")!=null?session.getAttribute("msg"):"");%> <!-- Mensagem (Erro ou correção)-->
			<%out.println(session.getAttribute("sem resposta")!=null && session.getAttribute("msg")==null?
					session.getAttribute("sem resposta"):
						""); %><!-- Mensagem caso sem resposta -->
			<br><br>
			<input type="submit" class="botao" value="Corrigir">
			<input method="quiz.jsp" class="botao" value="voltar">	
		
		</form>
	</fieldset>
	
	<%		// Botão de próximo
			if(session.getAttribute("msg") != null){
				out.println("<script type='text/javascript'>	document.getElementById('Question').disabled = true </script>");
				out.println("<form action='Quiz' method=post><input type='submit' value='Próxima'></form>"); 
			}
	%>
	
	<!-- Deixe no fim do body -->
	<%
			session.removeAttribute("msg");
			response.setHeader("Pragma", "No-cache");			
			response.setHeader("Cache-Control", "no-store");
			response.setDateHeader("Expires", 0);
		}
	%>
</body>
</html>