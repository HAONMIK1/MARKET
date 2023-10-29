<%@page import="market.prod.ProdBean"%>
<%@page import="market.prod.ProdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
.fqUDQ {
    background-color:black; ;
    border: 1px solid rgb(223, 0, 0);
    color: rgb(255, 255, 255);
}
button {
	width: 100px;
	height: 50px;
}
</style>
<%@ include file="tradeTop.jsp"%>
<tr>
	<td width="1000" height="500">
	<%
	String pnum = request.getParameter("pnum");
	ProdDao pdao =ProdDao.getInstance();
	ProdBean pb= pdao.selectNumProd(pnum);
	%>
	<table border="0">
		<tr>
		<td rowspan="4">
		<img alt="" src="../img/<%=pb.getTimg()%> " width="400">
		<td>
		<td width="300" align="center">
		<table border="0">
		<tr><td><%=pb.getTcate()%> > </td></tr>
		<tr><td><h2><%=pb.getTname()%></h2></td></tr>
		<tr><td><h2><%=pb.getTprice()%> 원  </h2></td></tr>
		<tr><td><%=pb.getTinfor()%></td></tr>
		</table>		
		</td>
		</tr>
		
		<tr>
		<td colspan="2" align="right" >
		<button class="fqUDQ" >댓 글  </button>
		</td>
		</tr>
	</table>
	</td>
</tr>
<jsp:include page="../home/bottom.jsp" />