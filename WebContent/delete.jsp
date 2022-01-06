<!-- addList에서 id pw를 받아오고 sql 쿼리에서 password 를 비교한다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>

<%
//guestbookDao를 메모리에 올린다.
GuestbookDao guestbookDao = new GuestbookDao();

//deleteForm 에서 받아온 password
String password = request.getParameter("password");

//deleteForm 에서 받아온 id를 숫자로 바꿔준다
int ContentId = Integer.parseInt(request.getParameter("id"));

//전송된 값을 vo객체로 정리하기
GuestbookVo guestbookVo = new GuestbookVo(ContentId, password);

//비번 검증 메서드 (글번호no를 넣으면 올바른 password를 리턴)
guestbookDao.checkPassword(ContentId);



//에러 탐지용 tostring
System.out.println(guestbookVo.toString());

if (password == "1233") {
	//비번이 맞으면 삭제
	System.out.println("비번 일치 삭제함");
	//삭제한다
	new GuestbookDao().ContentDelete(ContentId);
} else {
	System.out.println("비번 불일치 삭제안함");
	//비번이 틀리면 리다이렉트
	//response.sendRedirect("./addList.jsp");
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
