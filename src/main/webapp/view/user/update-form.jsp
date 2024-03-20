<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>ȸ����������</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/javascript/user/updateUser.js"></script>

</head>

<body data-context-path="${pageContext.request.contextPath}">
    <c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
    <c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>

    <main>
        <div class="inner-header">
            <h2 class="page-title">ȸ����������</h2>
        </div>
        <form:form name="update-form" modelAttribute="user">
            <div class="form-item">
				<label class="form-label">���̵�</label>
				<form:input path="userId" type="text" cssClass="form-input" readonly="true"/>
			</div>
			<div class="form-item">
				<label class="form-label" for="username">�̸�</label>
                <form:input path="userName" type="text" cssClass="form-input" id="username"/>
			</div>
			<div class="form-item">
				<label class="form-label" for="ssn">�ֹι�ȣ</label>
                <form:input path="ssn" cssClass="form-input" id="ssn" placeholder="- ���� 13�ڸ� �Է�"/>
			</div>
			<div class="form-item">
				<label class="form-label" for="address">�ּ�</label>
                <form:input path="addr" type="text" cssClass="form-input" id="address"/>
			</div>
			<div class="form-item">
				<label class="form-label">�޴���ȭ��ȣ</label>
				<select name="phone1" class="phone-number">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				<input type="number" name="phone2" class="phone-number">
				-
				<input type="number" name="phone3" class="phone-number">
                <form:input path="phone" type="hidden"/>
			</div>
			<div class="form-item">
				<label class="form-label" for="email">�̸���</label>
                <form:input path="email" cssClass="form-input" type="text" id="email" readonly="true"/>
			</div>
			<div class="form-item">
				<label class="form-label" for="role-select">����</label>
				<select name="role" id="role-select">
					<option value="user" ${user.role.role == 'user' ? "selected" : ""}>����</option>
					<option value="seller" ${user.role.role == 'seller' ? "selected" : ""}>�Ǹ���</option>
				</select>
			</div>

			<div class="btn-box">
				<button type="button" class="btn btn--update">����</button>
				<button type="button" class="btn btn--cancel">���</button>
			</div>
        </form:form>
    </main>
</body>
</html>
