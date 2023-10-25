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
<h1 align="center"><a href="../home/main.jsp" >NAK MARKET</a></h1>
<table width ="1000" border="1" align="center">

<tr><td>
<%if(id.equals("")){ %>
<span style="text-align: right; " class="right" > <a href="../home/login.jsp">로그인</a>  <a href="../home/join.jsp">회원가입</a></span>
<%}else{ %>
<a class="right" href="prductSell.jsp?id=<%=id%>"><img src="https://m.bunjang.co.kr/pc-static/resource/bcc7abb5d531bcf26033.png" width="23" height="26" alt="판매하기버튼 이미지">판매하기</a>
<a class="right" href="/shop/12168604/products"><img src="https://m.bunjang.co.kr/pc-static/resource/31370b164bc5b7cc4fef.png" width="23" height="24" alt="내상점버튼 이미지">내상점</a>
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


