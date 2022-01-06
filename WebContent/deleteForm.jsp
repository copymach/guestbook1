<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>

<%
//guestbookDao를 메모리에 올린다.
GuestbookDao guestbookDao = new GuestbookDao();
int no = Integer.parseInt(request.getParameter("no"));

GuestbookVo guestbookVo = guestbookDao.getNo(no); 

int id = guestbookVo.getNo();
String password = guestbookVo.getPassword();

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert 비번 here</title>
</head>
<body>

<table>
	<tr><td>비밀번호를 입력하세요. <form action="./delete.jsp" method="get"><input type="password" name="passowrd" value="<%=password%>"></form></td></tr>
	<tr><td></td></tr>
</table>
<br>
<a href="./addList.jsp"> 목록으로 돌아가기</a>

</body>
</html>