<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>

<%
//다오 메모리에 올리기
GuestbookDao guestbookDao = new GuestbookDao();

//guestbook List 가져오기 
List<GuestbookVo> guestbookList = guestbookDao.getList();


//테스트
System.out.println(guestbookList.toString());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 GuestBook</title>
</head>
<body>
	<h1>방명록</h1>

	<!-- 방명록 입력 시작 -->
	<form action="./add.jsp" method="get">
		<table border="1" width="500px">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=""></td>
				<td>비밀번호</td>
				<td><input type="password" name="passowrd" value=""></td>
			</tr>
			<tr>
				<td colspan="4"><textarea name="content" rows="5" cols="60"
						placeholder="여기에 인삿말을 적어주세요."> </textarea></td>
			</tr>
			<tr>
				<td><button type="submit">저장</button></td>
			</tr>
		</table>
	</form>
	<!-- 방명록 입력 종료 -->
	<br>



	<!-- 리스트영역 -->
	<%
	for (int i = 0; i < guestbookList.size(); i++) {
	%>
	<table border="1" width="500px">
		<tr>
			<td><%=guestbookList.get(i).getNo()%></td>
			<td><%=guestbookList.get(i).getName()%></td>
			<td><%=guestbookList.get(i).getRegDate()%></td>
			<td><a href=./deleteForm.jsp?id=<%=guestbookList.get(i).getNo()%>>삭제</a></td>
		</tr>
		<tr>
			<td colspan="4"><%=guestbookList.get(i).getContent()%></td>
		</tr>
	</table>
	<!-- 리스트영역 종료-->
	<br>
	<%
	}
	%>

</body>
</html>