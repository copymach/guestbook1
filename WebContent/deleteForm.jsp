<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- addList에서 id의 숫자로 삭제할 것을 보냈다 -->

<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>

<%
//guestbookDao를 메모리에 올린다.
GuestbookDao guestbookDao = new GuestbookDao();

//addList 에서 받아온 id를 숫자로 바꿔준다
int ContentId = Integer.parseInt(request.getParameter("id"));

GuestbookVo guestbookVo = guestbookDao.getNo(ContentId);

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

	<h2>글 삭제하려면 비밀번호를 입력하고 삭제버튼을 누르세요.</h2>
	<br>

	<form action="./delete.jsp" method="get">
		<table>
			<tr>
				<td>방명록 글ID (type=hidden 처리예정)</td>
				<td><input type="text" name="id" value="<%=id%>" readonly></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passowrd"
					value="<%=password%>">
					<button type="submit">삭제</button></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<a href="./addList.jsp"> 목록으로 돌아가기 (상대경로)</a>
	<br>

	<h3>java if로 삭제해보기</h3>
	<form action="./delete-java.jsp" method="get">
		<table>
			<tr>
				<td>방명록 글ID (type=hidden 처리예정)</td>
				<td><input type="text" name="id" value="<%=id%>"></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passowrd"
					value="<%=password%>">
					<button type="submit">삭제</button></td>
			</tr>
		</table>
	</form>

</body>
</html>