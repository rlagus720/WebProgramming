<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<% 	request.setCharacterEncoding("UTF-8"); %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
	
	try {
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "jspbook", "passwd");
		String sql = "insert into members values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("birthdate"));
		pstmt.setString(3, request.getParameter("email"));
		pstmt.setString(4, request.getParameter("id"));
		pstmt.setString(5, request.getParameter("pw"));
		
		if(request.getParameter("id") != null) {
			pstmt.executeUpdate();
		}
	}
	catch(Exception e) {
		System.out.println(e);
	}
%>
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
		비밀번호 확인:<input type="password" name="pw1"><br/>
		
		<input type="submit" value="가입하기">
		
	</form>
	<script type="text/javascript">
    function test() {
      var p1 = document.getElementByName('pw').value;
      var p2 = document.getElementByName('pw1').value;
      if( p1 != p2 ) {
        alert("비밀번호가 일치 하지 않습니다");
        return false;
      } else{
        alert("비밀번호가 일치합니다");
        return true;
      }

    }
  </script>

</body>
</html>