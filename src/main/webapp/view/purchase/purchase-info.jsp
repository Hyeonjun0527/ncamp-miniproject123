<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>���Ż���ȸ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/javascript/purchase/purchaseInfo.js"></script>

</head>

<body data-context-path="${pageContext.request.contextPath}">
    <c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
    <c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>

    <main>
        <div class="inner-header">
            <h2 class="page-title">���� �� ��ȸ</h2>
        </div>
        <ul>
            <li>
                <label>���Ź�ȣ</label>
                <p>${purchaseData.tranNo}</p>
            </li>
            <li>
                <label>������ ���̵�</label>
                <p>${purchaseData.buyer.userId}</p>
            </li>
            <li>
                <label>���Ź��</label>
                <p>${purchaseData.paymentOption.paymentName}</p>
            </li>
            <li>
                <label>������ �̸�</label>
                <p>${purchaseData.receiverName}</p>
            </li>
            <li>
                <label>������ ����ó</label>
                <p>${purchaseData.receiverPhone}</p>
            </li>
            <li>
                <label>�����</label>
                <p>${purchaseData.divyAddr}</p>
            </li>
            <li>
                <label>���� ��û ����</label>
                <p>${purchaseData.divyRequest}</p>
            </li>
            <li>
                <label>��������</label>
                <p>${purchaseData.divyDate}</p>
            </li>
            <li>
                <label>�ֹ���</label>
                <p>${purchaseData.orderDate}</p>
            </li>
        </ul>
        <table>
            <thead>
                <tr>
                    <th>��ǰ��</th>
                    <th>����</th>
                    <th>����</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tranProd" items="${purchaseData.transactionProductions}">
                    <tr class="prod-item" data-prod-no="${tranProd.product.prodNo}">
                        <td><a class="prod-no">${tranProd.product.prodNo}</a></td>
                        <td>${tranProd.product.price}</td>
                        <td>${tranProd.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="btn-box">
            <button type="button" class="btn btn--update" data-tran-no="${purchaseData.tranNo}">����</button>
            <button type="button" class="btn btn--cancel">�ڷ�</button>
        </div>
    </main>
</body>
</html>