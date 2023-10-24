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
</li>

<li>
<a href="searchpw.jsp">비밀번호 찾기</a>
</li>
</ul>
</nav>
<section>
<hr color="blue">
<form action="searchpwProc.jsp">
	<table >
		<tbody align="center">
			<tr>
				<th scope="col">아이디</th>
				<td>
				<input class="" type="text" name="id" >
				<span class=""></span>
				</td>
			</tr>
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
	<td>
		<input type="submit" value="비밀번호 찾기" >
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