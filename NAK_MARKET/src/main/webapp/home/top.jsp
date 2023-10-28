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
  }
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	if(id==null){
		id="";
	}
%>
<h1 align="center"><a href="../home/main.jsp?id=<%=id%>" >NAK MARKET</a></h1>
<table width ="1000" align="center">

<tr><td>
<%if(id.equals("")){ %>
<span style="text-align: right; " class="right" > <a href="../home/login.jsp">로그인</a>  <a href="../home/join.jsp">회원가입</a></span>
<%}else{ %>
<span style="text-align: right; " class="right" > <a href=""><%=id %>님</a> <a href="../home/main.jsp">로그아웃</a></span>
<%} %>
<br>

<tr>
<form action="" method="post">
<th> <span style="text-align:left;" class="left" >   NAK </span>


<a href="../trade/tradeMain.jsp?id=<%=id%>">중고거래</a> |
<a href="">알바</a> |
<a href="">동네 게시판</a>
 
 
<span  style="text-align:  right;" class="right">
<input type="text" name="search" placeholder="물품을 검색해보세요">
<input type="submit" value="검색">
</form>
</span> 
 </th>
</tr>
</tr>


