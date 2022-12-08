<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Pets</title>
</head>
<body>
	<%@ page import="com.petshop.dao.PetDao, com.petshop.model.Pet, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"%>

	<h1> Listagem de Pets</h1>
	
	<%
		List<Pet> list = PetDao.getAllPets();
		request.setAttribute("list", list);
	%>
	<table border="1">
		<tr> 
			<th>ID</th>
			<th>Nome</th>
			<th>Raça</th>
			<th>Espécie</th>
			<th>Dono</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>
		<c:forEach items="${list}" var="pet">
			<tr>
				<td>${pet.getId()}</td>
				<td>${pet.getNome()}</td>
				<td>${pet.getEspecie()} </td>
				<td>${pet.getRaca()}</td>
				<td>${pet.getDono()}</td>
				<td><a href="ViewEditForm.jsp?id=${pet.getId()}">Editar</a></td>
				<td><a href="#">Excluir</a></td>				
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="#">Incluir</a>
</body>
</html>