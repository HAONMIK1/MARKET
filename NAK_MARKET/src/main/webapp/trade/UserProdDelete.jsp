<%@page import="market.produser.ProdUserBean"%>
<%@page import="market.produser.ProdUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id =request.getParameter("id"); 
	String tnum =request.getParameter("tnum"); 
	ProdUserDao pudao=ProdUserDao.getInstance();
	int cnt = pudao.DeleteNumProd(tnum, id);
	if(cnt==1){		
%>
	<script type="text/javascript">
	alert("삭제 성공");
</script>
<%}
	response.sendRedirect("tradeuser.jsp?id="+id);
%>