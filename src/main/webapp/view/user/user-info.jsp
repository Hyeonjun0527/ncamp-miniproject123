<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>ȸ��������ȸ</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css" type="text/css">

</head>

<body data-context-path="${pageContext.request.contextPath}">
	<c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
	<c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>

	<main>
		<div class="inner-header">
			<h2 class="page-title">ȸ��������ȸ</h2>
		</div>
		<ul class="user-info">
			<li class="user-info-item">
				<label>���̵�</label>
				<p>${user.userId}</p>
			</li>
			<li class="user-info-item">
				<label>�̸�</label>
				<p>${user.userName}</p>
			</li>
			<li class="user-info-item">
				<label>�ּ�</label>
				<p>${user.addr}</p>
			</li>
			<li class="user-info-item">
				<label>�޴���ȭ��ȣ</label>
				<p>${user.phone}</p>
			</li>
			<li class="user-info-item">
				<label>�̸���</label>
				<p>${user.email}</p>
			</li>
			<li class="user-info-item">
				<label>��������</label>
				<p>${user.regDate}</p>
			</li>
		</ul>

		<div class="button-container">
			<button class="btn btn--update">����</button>
			<button class="btn btn--back">�ڷ�</button>
		</div>
	</main>
</body>
</html>