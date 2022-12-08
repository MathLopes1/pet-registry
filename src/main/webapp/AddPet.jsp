<%@ page import="com.petshop.dao.PetDao, java.util.*"%>
<jsp:useBean id="pet" class= "com.petshop.model.Pet"></jsp:useBean>
<jsp:setProperty property="*" name="pet"/>

<%
	int i = PetDao.create(pet);

	if(i > 0) {
		response.sendRedirect("addPet-Sucess.jsp");
	} else {
		response.sendRedirect("addPet-error.jsp");
	}
%>