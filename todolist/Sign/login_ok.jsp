<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
    
	// DB 연결에 필요한 변수 선언
	String url = "jdbc:mysql://localhost/jspdb?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
	String uid = "jspbook"; // MySQL 계정으로 변경
	String upw = "passwd"; // MySQL 비밀번호로 변경
	
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from members where id = ? and pw = ?";
	
	try{
		// 드라이버 호출
		Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 드라이버로 변경
		
		// conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		// SQL 실행
		rs = pstmt.executeQuery();
		
		if(rs.next()){ // 로그인 성공 (인증의 수단 session)
			id = rs.getString("id");
			pw = rs.getString("pw");
		
			session.setAttribute("user_id", id);
			session.setAttribute("user_pw", pw);
			
			response.sendRedirect("main.jsp"); // 페이지 이동
			
		} else{ // 로그인 실패
			response.sendRedirect("login_fail.jsp"); // 실패 페이지
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login_0.jsp"); // 에러가 난 경우도 리다이렉트
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
 %>
