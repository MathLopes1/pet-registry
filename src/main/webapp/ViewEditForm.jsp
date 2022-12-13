<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edição do Pets</title>
<link rel="stylesheet" type="text/css" href="./css/edit-style.css">
</head>
<body>
	<%@ page import="com.petshop.dao.PetDao, com.petshop.model.Pet, java.util.*"%>

	<div id="header-area">
          <div id="area-logo">
              <h1>PetShop<span class="span-white">Nassau</span></h1>
          </div>
    </div>
	<%		
		String id = request.getParameter("id");
		Pet pet = PetDao.getById(Long.parseLong(id));
	%>
	
	<form action="EditPet.jsp" method="post">
		<input type="hidden" name="id" value="<%=pet.getId()%>"/>
		<table>
			<tr>
				<td>Nome: </td>
				<td><input type="text" name="nome" value="<%=pet.getNome()%>" /></td>
			</tr>
			<tr>
				<td>Raça: </td>
				<td><input type="text" name="raca" value="<%=pet.getRaca()%>" /></td>
			</tr>
			<tr>
				<td>Espécie: </td>
				<td><input type="text" name="especie" value="<%=pet.getEspecie()%>" /></td>
			</tr>
			<tr>
				<td>Dono: </td>
				<td><input type="text" name="dono" value="<%=pet.getDono()%>" /></td>
			</tr>
			<tr>
				<td><input type= "submit" value="Editar Pet"></input></td>
			</tr>
		</table>
	</form>
</body>
</html>