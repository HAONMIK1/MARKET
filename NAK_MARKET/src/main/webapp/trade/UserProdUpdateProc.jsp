<%@page import="market.prod.ProdDao"%>
<%@page import="market.produser.ProdUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
	String[] timgs = request.getParameterValues("timg"); 
	String id =request.getParameter("id");
	String retimg =request.getParameter("retimg");
	int tnum =Integer.parseInt(request.getParameter("tnum"));
	String timg="";
	for(int i =0 ;i<timgs.length;i++){
	timg += timgs[i];
	}
%>
<jsp:useBean id="PUB" class="market.produser.ProdUserBean"/>
<jsp:setProperty property="*" name="PUB"/>
<jsp:useBean id="PB" class="market.prod.ProdBean"/>
<jsp:setProperty property="*" name="PB"/>
<%
	if(!retimg.equals(null))
	{
		PUB.setTimg(retimg);
		PB.setTimg(retimg);
	}
ProdUserDao puDao=ProdUserDao.getInstance();
ProdDao pDao=ProdDao.getInstance();
	System.out.print(PUB.getTlocation());
	int cn = puDao.UpdateUser(PUB,id,tnum);
	int cnt = pDao.UpdateUser(PB,id,tnum);
if(cnt>=1){
	
%>
<script type="text/javascript">
alert("성공!!!!!!!!!!");
location.href="tradeuser.jsp?id=<%=id%>";
</script>

<%}%>