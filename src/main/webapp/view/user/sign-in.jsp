<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
    <title>�α���</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/javascript/user/signInForm.js"></script>

</head>

<body data-context-path="${pageContext.request.contextPath}">
    <c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
    <c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>

    <main>
        <div class="login-form-container">
            <h2>�α���</h2>
            <form class="login-form" name="login-form">
                <div class="form-item">
                    <label class="form-label">���̵�</label>
                    <input class="form-input" name="userId" type="text" placeholder="ID">
                </div>
                <div class="form-item">
                    <label class="form-label">�н�����</label>
                    <input class="form-input" name="password" type="password" placeholder="PASSWORD">
                </div>
                <div class="btn-box">
                    <button class="btn btn--sign-in" type="button">�α���</button>
                    <button class="btn btn--sign-up" type="button">ȸ������</button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>
