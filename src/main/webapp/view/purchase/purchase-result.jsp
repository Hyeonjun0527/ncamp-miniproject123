<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
    <c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
    <c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>

    <main>
        <div class="inner-header">
            <h2 class="page-title">������ ���� ���Ű� �Ǿ����ϴ�.</h2>
        </div>

        <ul>
            <li>
                <p>������ ���̵�</p>
                <p>${purchaseData.buyerId}</p>
            </li>
            <li>
                <p>���� ���</p>
                <p>${purchaseData.paymentOption.paymentName}</p>
            </li>
            <li>
                <p>������ �̸�</p>
                <p>${purchaseData.receiverName}</p>
            </li>
            <li>
                <p>������ ����ó</p>
                <p>${purchaseData.receiverPhone}</p>
            </li>
            <li>
                <p>�ּ�</p>
                <p>${purchaseData.divyAddr}</p>
            </li>
            <li>
                <p>���� ��û ����</p>
                <p>${purchaseData.divyRequest}</p>
            </li>
            <li>
                <p>��� ��� ����</p>
                <p>${purchaseData.divyDate}</p>
            </li>
        </ul>
        <table>
            <thead>
                <th>��ǰ��ȣ</th>
                <th>����</th>
            </thead>
            <tbody>
                <c:forEach var="tranProd" items="${purchaseData.transactionProductions}">
                    <tr>
                        <td>${tranProd.product.prodNo}</td>
                        <td>${tranProd.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>