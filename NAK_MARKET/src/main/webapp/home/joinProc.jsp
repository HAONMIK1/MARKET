<%@page import="market.users.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<jsp:useBean id="ub" class="market.users.UserBean"/>
<jsp:setProperty property="*" name="ub"/>
<%
	UserDAO udao =UserDAO.getInstance();
	int cnt = udao.insertUser(ub);
	if(cnt==1){
		%>
		<script type="text/javascript">
		alert("회원가입을 축하합니다")
		</script>
		<%
		response.sendRedirect("login.jsp");
	}else{
		response.sendRedirect("join.jsp");
	}

%>