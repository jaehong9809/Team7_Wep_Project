<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<form action=board_process.jsp method="post">
		<p><textarea name="title" cols="30" rows="1" wrap="soft" placeholder="제목을 입력하세요."></textarea>
		<p><textarea name="content" cols="30" rows="10" wrap="soft" placeholder="내용을 입력하세요"></textarea>
		<p><input type="submit" value="등록">
	</form>
	<form action="board.jsp" method="post">
		<input type="submit" value="취소">
	</form>
</body>
</html>