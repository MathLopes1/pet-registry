<%@ page import="com.petshop.dao.PetDao, java.util.*"%>
<jsp:useBean id="pet" class= "com.petshop.model.Pet"></jsp:useBean>
<jsp:setProperty property="*" name="pet"/>

<%
	int i = PetDao.updateById(pet);
	response.sendRedirect("ViewPet.jsp");
%>