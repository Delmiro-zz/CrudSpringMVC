<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adicionar Contas.</title>
</head>
<body>
	<h3>Adicionar Contas</h3>
	<form action="/contas/listaContas"><input type="submit" value="Lista de Contas" /></form>
	<form action="adicionaConta" method="post">
		Descrição: <br/>
		<textarea name="descricao" rows="5" cols="100"></textarea>
		<br/>
		<form:errors path="conta.descricao"/><br/><br/>	
		Valor<input type="text" name="valor"/><br/>
		<br/>
		Tipo:
		<select name="tipo" >
			<option value="ENTRADA">Entrada</option>
			<option value="SAIDA">	Saída</option>
		</select>
		<br/>
		<br/>
		<input type="submit" value="Adicionar">
	</form>
</body>
</html>