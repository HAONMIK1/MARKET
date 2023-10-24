<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="loginStyle.css" type="text/css">

<style>
.login {
    background: #346aff;
    padding: 12.5px 0;
    border-radius: 4px;
    font-size: 16px;
    box-shadow: none;
    line-height: 19px;
}
.member_id, .member_pw{
    margin: 0;
    height: 48px;
    box-sizing: border-box;
    width: 60%;
    padding: 16px 0 12px;
    border: 1 ;
    background: none transparent;
    font-family: dotum,sans-serif;
    font-size: 14px;
    line-height: 20px;
    color: #111;
    font-weight: 700;
    text-indent: 12px;
}
.member__message-area {
    display: block;
    margin: 9px 12px 0;
    padding: 0;
    font-family: dotum,sans-serif;
    font-size: 12px;
    line-height: 18px;
    cursor: default;
    color: #e52528;
}

input {
    vertical-align: middle;
}
.login__link--find-id-password {
    float: right;
    position: relative;
    padding-right: 12px;
}
.login__link {
    text-decoration: none;
    color: #0073e9;
    font-size: 14px;
    line-height: 24px;
}
a {
    background: transparent;
}
.login__button.login__button--submit {
    background: #346aff;
    padding: 12.5px 0;
    border-radius: 4px;
    font-size: 16px;
    box-shadow: none;
    line-height: 19px;
        text-align: center;
    transition: background-color .75s ease;
    font-weight: 700;
    text-decoration: none;
    width: 60%;
}
.login__button.login__button--join {
    padding: 11.5px 0;
    border-radius: 4px;
    font-size: 16px;
    box-shadow: none;
    line-height: 19px;
    background: #fff;
    color: #454f5b;
    border: 1px solid #919eab;
    margin-top: 16px;
    text-align: center;
    transition: background-color .75s ease;
    font-weight: 700;
    text-decoration: none;
    width: 60%;
}
.join{
   width: 60%;
      font-size: 16px;
      color: #454f5b;
        line-height: 19px;
         font-weight: 700;
         height: 50px;
}
</style>
<jsp:include page="top.jsp"/>
<form action="loginProc.jsp" method="post">
<tr>
<td width="1000" height="500" align="center">
<input type="id"maxlength="80" name="id" class="member_id" value="" placeholder="아이디" autocomplete="off">
<br>
<div class="member__message-area" style="">아이디를 입력해주세요.</div>
<br>
<input type="password"  value="" name="password" class="member_pw"  placeholder="비밀번호">
<br>
<div class="member__message-area " style="">비밀번호를 입력해주세요.</div>
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
<hr style="background-color:  gray;">
<br>
<button type="button"  class="join" onclick="location.href='join.jsp'">회원가입</button>
</td>
</tr>
</form>
<jsp:include page="bottom.jsp"/>