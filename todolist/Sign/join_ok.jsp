<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
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
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect("login_0.jsp");
		} else{ // 실패
			response.sendRedirect("join_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>