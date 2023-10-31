<%@page import="market.users.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ub" class="market.users.UserBean" />
<jsp:setProperty property="*" name="ub"/>
<%
	UserDAO udao = UserDAO.getInstance();
	String pw = udao.searchIDNameHp(ub);
	if(pw!=""){
		%>
<script type="text/javascript">
alert("비밀번호는 <%=pw%>입니다");
</script>
<%
response.sendRedirect("login.jsp");
	}
	else{
		%>
<script type="text/javascript">
alert("입력한 정보가 틀렸습니다");
</script>

<%
response.sendRedirect("login.jsp");
	}
	
%>
