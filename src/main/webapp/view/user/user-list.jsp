<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>ȸ�� �����ȸ</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/javascript/user/userList.js"></script>

</head>

<body>
    <c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
    <c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>
    <main data-context-path="${pageContext.request.contextPath}">
        <div class="inner-header">
            <h2 class="page-title">ȸ�� ��� ��ȸ</h2>
            <form class="search">
                <select name="searchCondition" class="search-condition">
                    <option value="0" ${!empty searchVO.searchCondition && searchVO.searchCondition == "0" ? "selected" : ""}>ȸ�� ID</option>
                    <option value="1" ${!empty searchVO.searchCondition && searchVO.searchCondition == "1" ? "selected" : ""}>ȸ����</option>
                </select>
                <input type="text"
                       name="searchKeyword"
                       value="${!empty searchVO.searchKeyword ? searchVO.searchKeyword : ''}"
                       placeholder="�˻��� �Է�">
                <button type="submit">�˻�</button>
            </form>
            <p>��ü ${total}�Ǽ�, ���� ${currentPage} ������</p>
        </div>
        <table class="list">
            <thead>
                <tr>
                    <td>No</td>
                    <td>ȸ�� ID</td>
                    <td>ȸ����</td>
                    <td>�̸���</td>
                </tr>
            </thead>
            <tbody>
                <c:set var="no" value="${list.size()}" scope="page"/>
                <c:forEach var="data" items="${list}">
                    <tr>
                        <td>${no}</td>
                        <c:set var="no" value="${no - 1}" scope="page"/>
                        <td><a class="user-id" data-user-id="${data.userId}">${data.userId}</a></td>
                        <td>${data.userName}</td>
                        <td>${data.email}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="page-nav" data-current-page="${currentPage}">
            <c:forEach var="i" begin="1" end="${totalPage}" step="1">
                <a class="page-nav-item" data-page="${i}">${i}</a>
            </c:forEach>
        </div>
    </main>
</body>
</html>