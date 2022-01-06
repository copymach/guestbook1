<!-- addList에서 숫자를 받아오고 sql 쿼리에서 password 를 비교한다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>
<%
//guestbookDao를 메모리에 올린다.
GuestbookDao guestbookDao = new GuestbookDao();

//에러 탐지용 tostring
//System.out.println(GuestbookVo.toString());

int no = Integer.parseInt(request.getParameter("no"));
GuestbookVo guestbookVo = guestbookDao.getNo(no); 

int id = guestbookVo.getNo();
String pass = guestbookVo.getPassword();

/* DELETE FROM guestbook WHERE no = 1 ; */
//삭제한다
new GuestbookDao().ContentDelete(no);

new GuestbookDao().getPassword(pass);

if (pass == String I="1234") {
	//비번이 맞으면 삭제
	System.out.println("비번 일치");
} else {
	//비번이 틀리면 리다이렉트
	response.sendRedirect("./addList.jsp");
}

//리다이렉트
//response.sendRedirect("./list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>디스 이즈 삭제 페이지
</body>
</html>