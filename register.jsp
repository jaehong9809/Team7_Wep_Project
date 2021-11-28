<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<script type="text/javascript">
	function checkMember(){
		var regExpId = /^[a-zA-Z0-9]/;
		var regExpPasswd=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,12}$/
		var regExpName= /^[가-힣]*$/;
		var regExpPhone= /^\d{3}-\d{3,4}-\d{4}$/;
		
		var form=document.Member;
		
		var id=form.id.value;
		var passwd= form.passwd.value;
		var name= form.name.value;
		var phone= form.phone1.value+"-"+form.phone2.value+"-"+form.phone3.value;
		
		if(!regExpId.test(id)){
			alert("아이디는 영어와 숫자");
			form.id.select();
			return;
		}
		if(!regExpPasswd.test(passwd)){
			alert("비밀번호는 영문 대소문자 숫자 8~12 자리");
			form.passwd.select();
			return;
		}
		if(!regExpName.test(name)){
			alert("이름은 한글만");
			form.name.select();
			return;
		}
		if(!regExpPhone.test(phone)){
			alert("연락처 확인");
			return;
		}
		form.submit();
	}
</script>
<body>
	<dev style="height:1200px;width:100%;text-align: center;">
	<form action="register_process.jsp" name="Member" method="post"  style="text-align:center;border:3px solid #04B4AE;
	border-radius: 0.5em; margin-left:35%;margin-top:10%;width:30%; height:100%;">
	<p style="font-size:1.5em;">아이디&nbsp;&nbsp; <input type="text" name="id" style="height:2em;width:50%;background-color:rgb(232, 249, 253);">
	<p style="font-size:1.5em;">비밀번호 <input type="password" name="passwd" style="height:2em;width:50%;background-color:rgb(232, 249, 253);">
	<p style="font-size:1.5em;">이 름&nbsp;&nbsp; <input type="text" name="name" style="height:2em;width:50%;background-color:rgb(232, 249, 253);">
	<p style="font-size:1.5em;">주 소&nbsp;&nbsp; <input type="text" name="addr" style="height:2em;width:50%;background-color:rgb(232, 249, 253);">
	<p style="font-size:1.5em;">연락처&nbsp;&nbsp; <select name="phone1" style="height:2em;width:50px;background-color:rgb(232, 249, 253);">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="019">019</option>
	</select> - <input type="text" maxlength="4" size="4" name="phone2" style="height:2em;width:50px;background-color:rgb(232, 249, 253);"> - 
				<input type="text" maxlength="4" size="4" name="phone3" style="height:2em;width:50px;background-color:rgb(232, 249, 253);">
	<p><input type="button" value="가입하기" onclick="checkMember()" style="height:38px;width:120px;border:3px solid green; background-color:#04B4AE; font-size:1.5em;border-radius: 0.5em;">
	<form action="login.jsp" method="post">
	<input type="submit" value="취소" style="height:38px;width:120px;border:3px solid green; background-color:#04B4AE; font-size:1.5em;border-radius: 0.5em;">
	</form>
	</form>
	
	</dev>
</body>
</html>