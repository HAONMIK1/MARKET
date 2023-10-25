<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="top.jsp"/>
<tr>
<td width="1000" height="500">
<section >
<h1 align="center" >계정찾기</h1>
<nav >
<ul>
<li >
<a href="searchIDPW.jsp">아이디 찾기</a>
<a href="searchpw.jsp">비밀번호 찾기</a>
</li>
</ul>
</nav>
<section a>
<hr color="blue">
<form action="searchidProc.jsp">
	<table align="center">
		<tbody>
			<tr>
				<th scope="col">이름</th>
				<td>
				<input class="" type="text" name="name" >
				<span class=""></span>
				</td>
			</tr>
			<tr>
				<th scope="col">핸드폰 번호</th>
				<td>
				<input class="" type="text" name="hp">
				<span class=""></span>
				</td>
			</tr>
	<tr>
	<td >
		<input type="submit" value="아이디 찾기">
	</td>
	</tr>
		</tbody>
		
	</table>
</form>
</section>
</section>
</td>
</tr>
<jsp:include page="bottom.jsp"/>