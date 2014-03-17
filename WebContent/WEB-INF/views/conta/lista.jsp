<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="resources/js/jquery.js"></script>
<script type="text/javascript">
	function deuCerto(dadosDaResposta){
		alert("Conta paga com sucesso!");
	}
	
	function pagaConta(id){
		$.get("pagaConta?id=" + id, deuCerto);
	}
</script>
</head>
<body>
	<table border="3"  bgcolor="green">
		<tr>
			<th>Código</th>
			<th>Descrição</th>
			<th>Valor</th>
			<th>Tipo</th>
			<th>Conta Paga</th>
			<th>Data do Pagamento</th>	
			<th>Ações</th>		
		</tr>
		<c:forEach items="${contas}" var="conta">
		<tr>
			<td>${conta.id}</td>
			<td>${conta.descricao}</td>
			<td>${conta.valor}</td>
			<td>${conta.tipo}</td>
			<td>${conta.paga == true ? "SIM": "NÃO"}</td>
			<td><fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/></td>		
			<td><a href="removeConta?id=${conta.id}"> Deletar</a></td>
			<td><a href="#" onclick="pagaConta(${conta.id});"> Pagar</a></td>
		</tr>
		</c:forEach>
	</table><br/>
		<form action="/contas/adicionaConta""><input type="submit" value="Voltar"/></form>
</body>
</html>