<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Pets</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
	<%@ page import="com.petshop.dao.PetDao, com.petshop.model.Pet, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"%>
	
	<div id="header-area">
          <div id="area-logo">
              <h1>PetShop<span class="span-white">Nassau</span></h1>
          </div>
          <div id="area-menu">
              <a href="index.html">Home</a>
              <a href="../animais/index.html">Cadastro de Animais</a>
          </div>
    </div>

	<div>	
	<%
		List<Pet> list = PetDao.getAllPets();
		request.setAttribute("list", list);
	%>
	<table>
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
				<td style="text-align: center;">${pet.getId()}</td>
				<td style="text-align: center;">${pet.getNome()}</td>
				<td style="text-align: center;">${pet.getEspecie()} </td>
				<td style="text-align: center;">${pet.getRaca()}</td>
				<td style="text-align: center;">${pet.getDono()}</td>
				<td style="text-align: center;"><a href="ViewEditForm.jsp?id=${pet.getId()}">Editar</a></td>
				<td style="text-align: center;"><a href="DeletePet.jsp?id=${pet.getId()}">Excluir</a></td>				
			</tr>
		</c:forEach>
	</table>
	<br>
	</div>
	<a style= "text-align: center; display: table-cell;" href="ViewAddPetForm.jsp">Incluir</a>
</body>
</html>