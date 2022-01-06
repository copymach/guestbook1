<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.javaex.vo.GuestbookVo"%>
<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="java.util.List"%>

<%
//guestbookDao를 메모리에 올린다.
GuestbookDao guestbookDao = new GuestbookDao();

//int no = Integer.parseInt(request.getParameter("no"));
String name = request.getParameter("name");
String password = request.getParameter("password");
String content = request.getParameter("content");
String regdate = request.getParameter("regdate");

//전송된 값을 vo객체로 만들기
GuestbookVo guestbookVo = new GuestbookVo(name, password, content, regdate);

//저장한다
guestbookDao.ContentInsert(guestbookVo);

//전체리스트를 가져온다
List<GuestbookVo> guestbookList = guestbookDao.getList();

//리다이렉트
response.sendRedirect("./addList.jsp");
%>

<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>저장 페이지
</body>
</html>
 -->