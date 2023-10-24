<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  쿠팡참고
https://login.coupang.com/login/memberJoinFrm.pang?rtnUrl=https%3A%2F%2Fwww.coupang.com%2Fnp%2Fpost%2Flogin%3Fr%3Dhttps%253A%252F%252Fwww.coupang.com%252F -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script> 
 <script type="text/javascript">
 function idcheck(){
		if($(input[name=id]).val()==""){
			alert("아이디를 입력하세요");
			$(input[name=id]).focus();
			isBlank = true;
			return;
		}
		$.ajax({
			url : "id_check_proc.jsp",
			data:({
				userid : $("input[name=id]").val()
			}),
			success : function(data){
				if($.trim(data)=="YES"){
					$("#idmessage").html("<font color='blue'>사용가능한 아이디입니다</font>")
					$("#idmessage").show();
					use="possible";
				}else{
					$("#idmeessage").html("<font color='red'>중복한 아이디입니다</font>");
					$("#idmessage").show();
					use="impossible";
				}
			}//success
			
		})//ajax
	}//idcheck
</script>
 <style type="text/css">
.join {
	width: 400px;
	height: 40px;
	
}
</style>
 <jsp:include page="top.jsp"/>  
<tr> <td align="center">
  <table>
  	<tr>
  		<td>
  			<form action="joinProc.jsp" method="post">
  			<h1 align="center">회원가입</h1>
  			<input type="text" class="join" onBlur="return idcheck()" name="id" placeholder="아이디">
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