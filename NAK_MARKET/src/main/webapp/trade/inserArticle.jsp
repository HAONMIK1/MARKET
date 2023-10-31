<%@page import="java.sql.Timestamp"%>
<%@page import="market.board.TradeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bb" class="market.board.TradeBoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
TradeBoardDao bdao = TradeBoardDao.getInstance();

bb.setIp(request.getRemoteAddr());
bb.setRegdate(new Timestamp(System.currentTimeMillis()));
System.out.print(bb.getTnum());

int cnt = bdao.insertArticle(bb); 
if(cnt==1){
	
	%>
<script type="text/javascript">
alert("댓글");
</script>
	<%
response.sendRedirect("tradeProducts.jsp?id="+bb.getId()+"&pnum="+bb.getTnum());
}
else{
	%>
	<script type="text/javascript">
	alert("no");
	history.go(-1);
</script>
	<%
}

%>