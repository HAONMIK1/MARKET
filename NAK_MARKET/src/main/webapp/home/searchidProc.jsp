<%@page import="market.users.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");	
%>
<jsp:useBean id="ub" class="market.users.UserBean" />
<jsp:setProperty property="*" name="ub" />
<%
	UserDAO udao =UserDAO.getInstance();
	String id = udao.searchNameHP(ub);
	if(id!=""){
		%>
<script type="text/javascript">
alert("아이디는 <%=id%>입니다");
location.href="searchIDPW.jsp";
</script>
<%
	}
	else{
		%>
<script type="text/javascript">
alert("아이디가 없습니다");
location.href="searchIDPW.jsp";
</script>
<%

	}
%>
