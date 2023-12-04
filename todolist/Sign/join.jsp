<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원가입</h2>
	
	<form action="join_ok.jsp" method="post">
		이름:<input type="text" name="name"><br/>
		생년월일:<input type="date" name="birthdate"><br/>
		이메일:<input type="text" name="email"><br/>
		아이디:<input type="text" name="id"><br/>
		비밀번호:<input type="password" name="pw"><br/>
		
		<input type="submit" value="가입하기">
		
	</form>

</body>
</html>