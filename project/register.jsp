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
	<form action="register_process.jsp" name="Member" method="post">
	<p>아이디:<input type="text" name="id">
	<p>비밀번호:<input type="password" name="passwd">
	<p>이름:<input type="text" name="name">
	<p>주소:<input type="text" name="addr">
	<p>연락처:<select name="phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="019">019</option>
	</select> - <input type="text" maxlength="4" size="4" name="phone2"> - 
				<input type="text" maxlength="4" size="4" name="phone3">
	<p><input type="button" value="가입하기" onclick="checkMember()">
	</form>
	<form action="login.jsp" method="post">
	<input type="submit" value="취소">
	</form>
</body>
</html>