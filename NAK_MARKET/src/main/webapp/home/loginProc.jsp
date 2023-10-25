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
	boolean cnt = udao.selectUser(ub);
	if(cnt){
	
		response.sendRedirect("main.jsp?id="+ub.getId());
	}else{
		%>
		<script type="text/javascript">
		alert("아이디나 비밀번호가 다릅니다")
		</script>
		<%
		response.sendRedirect("login.jsp");
	}

%>