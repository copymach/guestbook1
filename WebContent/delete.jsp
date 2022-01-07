<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- deleteForm에서 받아온 no password를 sql쿼리에서 비교해서
일치를 확인후 삭제 처리한다 -->

<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>

<%
//deleteForm 에서 받아온 id를 숫자로 바꿔준다
int no = Integer.parseInt(request.getParameter("no"));

//deleteForm 에서 받아온 password
String password = request.getParameter("password");


//guestbookDao를 메모리에 올린다.
//GuestbookDao guestbookDao = new GuestbookVo(no, password); Vo에 생성자만들면 됨

GuestbookDao guestbookDao = new GuestbookDao();
GuestbookVo guestbookVo = new GuestbookVo();
guestbookVo.setNo(no);
guestbookVo.setPassword(password);

guestbookDao.ContentDelete(guestbookVo);


//비번이 맞든 틀리든 리다이렉트
response.sendRedirect("./addList.jsp");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>