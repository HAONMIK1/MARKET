<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/home/loginStyle.css" type="text/css">
<script src="loginScript.jsp"></script>
<jsp:include page="top.jsp"/>
<form action="loginProc.jsp" method="post">
<tr height="500">
<td width="1000" height="500" align="center">
<input type="id"maxlength="80" name="id" class="member_id" placeholder="아이디" autocomplete="off">
<br>
<div class="member__message-area" style=""></div>
<br>
<input type="password"  value="" name="password" class="member_pw"  placeholder="비밀번호">
<br>
<div class="member__message-area " style=""></div>
<br>
<a href="searchIDPW.jsp"> 아이디∙비밀번호 찾기
<br>
<i class="member__sprite member__sprite--right-arrow"></i>
                            </a>
                            <br>
<button class="login__button login__button--submit _loginSubmitButton login__button--submit-rds" type="submit" >
                                로그인
                            </button>
<br>
<br>
<button type="button"  class="join" onclick="location.href='join.jsp'">회원가입</button>
</td>
</tr>
</form>
<jsp:include page="bottom.jsp"/>