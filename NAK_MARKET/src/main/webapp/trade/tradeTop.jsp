<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <style>
.right{
	float: right;

}
.left{
	float: left;

}
a {
  text-decoration-line: none;
  color: black;
  }
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String tloca = request.getParameter("tloca");
	if(tloca==null){
		tloca="위치등록";
	}
	if(id==null){
		id="";
	}
%>
<h1 align="center"><a href="../home/main.jsp?id=<%=id %>" >NAK MARKET</a></h1>
<table width ="1000" border="0" align="center">

<tr><td>
<%if(id.equals("")){ %>
<span style="text-align: right; " class="right" > <a href="../home/login.jsp">로그인</a>  <a href="../home/join.jsp">회원가입</a></span>
<%}else{ %>
<span>
<a class="right" href="prductSell.jsp?id=<%=id%>"><img src="https://m.bunjang.co.kr/pc-static/resource/bcc7abb5d531bcf26033.png" width="23" height="26" >판매하기</a>
<a class="right">&nbsp; &nbsp;  &nbsp; </a> 
<a class="right" href="tradeuser.jsp?id=<%=id%>"><img src="https://m.bunjang.co.kr/pc-static/resource/31370b164bc5b7cc4fef.png" width="23" height="24" >내상점</a>
</span>
<%} %>
<br>

<tr>
<form action="" method="post">
<th> <span style="text-align:left;" class="left" >   NAK 
&nbsp; <a href="../trade/tradeMain.jsp?id=<%=id%>">중고거래</a> 

</span>


<%
 String[] cate1 = {"남성의류", "신발", "가방", "시계", "쥬얼리", "디지털", "인테리어" };
 %>
 <%
 for (String i : cate1) {
 %> <a href="tradeCate2.jsp?id=<%=id%>&tcate=<%=i%>"><%=i%></a> &nbsp; &nbsp; &nbsp; 
 <%
 }
 %> 
 
<span  style="text-align:  right;" class="right">
<input type="text" name="search" placeholder="물품을 검색해보세요">
<input type="submit" value="검색">
</form>
</span> 
 </th>
</tr>
</tr>


