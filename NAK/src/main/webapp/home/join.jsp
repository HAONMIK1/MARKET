<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  쿠팡참고
https://login.coupang.com/login/memberJoinFrm.pang?rtnUrl=https%3A%2F%2Fwww.coupang.com%2Fnp%2Fpost%2Flogin%3Fr%3Dhttps%253A%252F%252Fwww.coupang.com%252F -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="JoinScript.js"></script> 
 <style type="text/css">
.join {
	width: 400px;
	height: 40px;
	
}
</style>
 <jsp:include page="top.jsp"/>  
<tr> <td align="center">
  <table height="500">
  	<tr>
  		<td>
  			<form action="joinProc.jsp" method="post">
  			<h1 align="center">회원가입</h1>
  			<input type="text" class="join"  name="id" placeholder="아이디">
  			<input type="button" onclick="idcheck()" value="중복체크">
  			<span id="idmessage"></span><br><br>
  			<input type="text" class="join"  name="password" onBlur="pwcheck()"  placeholder="비밀번호 (영문 소문자/숫자 조합 3~8)"><br>
  			<br>
  			<input type="text"  class="join" name="repassword"  onKeyUp="repassword_keyup()"  placeholder="비밀번호 확인"><br>
  			<span id="repwmessage"></span><br>
  			<input type="text"  class="join" name="name" placeholder="이름 입력하세요"><br><br>
  			<input type="text" class="join"  name="hp" placeholder="휴대폰 번호 입력히세요"><br><br><br>
  			<input type="submit"  class="join" value="회원가입">
  			</form>
	  	</td>
  	</tr>	
  
  </table>
  
</td>
</tr> 
 <jsp:include page="bottom.jsp"/>   