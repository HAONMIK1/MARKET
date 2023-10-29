<%@page import="market.prod.ProdDao"%>
<%@page import="market.produser.ProdUserDao"%>
<%@page import="market.produser.ProdUserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
	String[] timgs = request.getParameterValues("timg"); 
	String id =request.getParameter("id");
	String timg="";
	for(int i =0 ;i<timgs.length;i++){
	timg +=" "+timgs[i];
	}
%>
<jsp:useBean id="PUB" class="market.produser.ProdUserBean"/>
<jsp:setProperty property="*" name="PUB"/>
<jsp:useBean id="PB" class="market.prod.ProdBean"/>
<jsp:setProperty property="*" name="PB"/>
<%
	PUB.setTimg(timg);
ProdUserDao puDao=ProdUserDao.getInstance();
ProdDao pDao=ProdDao.getInstance();
	System.out.print(PUB.getTlocation());
	int tnum = puDao.insertUser(PUB,id);
	int cnt = pDao.insertUser(PB,tnum);
if(cnt>=1){
	
%>
<script type="text/javascript">
alert("성공!!!!!!!!!!");
location.href="tradeuser.jsp?id=<%=id%>";
</script>

<%}%>