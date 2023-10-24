/**
 * 
 */
 var isCheck = false;
var use;
var pwuse;
var pwerror; // 추가함
$(function(){
	$("input[name=id]").keydown(function(){
		$("#idmessage").css('display','none');
		isCheck = false;
		use = "";
	});
});
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
function repassword_keyup(){
	//alert(1);
	if($('input[name="password"]').val() == $('input[name="repassword"]').val() ){
		$('#repwmessage').html("<font color=blue>비번일치</font");
		pwuse = "same";
	}else{
		$('#repwmessage').html("<font color=red>비번 불일치</font");
		pwuse = "nosame";
	}
}//repassword_keyup


function pwcheck(){
	
	//alert(2);
	pvalue = $('input[name="password"]').val();
	var regexp = /^[a-z0-9]{3,8}$/i; // 영문 소문자/숫자 조합 3~8
	
	if(pvalue.search(regexp) == -1){
		alert('길이는 3~8로 입력하세요.');
		pwerror = "error"; // 추가함
		return false;
	}
	var chk_eng = pvalue.search(/[a-z]/); // 985
	var chk_num = pvalue.search(/[0-9]/); // sdf
	//alert(chk_eng +"," + chk_num);
	
	if(chk_eng<0 || chk_num<0){
		alert('영문 소문자/숫자 조합이 아닙니다.');
		pwerror = "error"; // 추가함
		return false;
	}else{ // 추가함
		pwerror = "";
	}
}//pwcheck
