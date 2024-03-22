<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <title>�������� ����</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/purchase/purchaseUpdateForm.js"
            type="text/javascript"></script>

</head>

<body data-context-path="${pageContext.request.contextPath}">
    <c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
    <c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>

    <main>
        <div class="inner-header">
            <h2 class="page-title">������������</h2>
        </div>
        <form name="purchase-update">
            <input type="hidden" name="tranNo" value="${purchaseData.tranNo}">
            <ul>
                <li>
                    <label for="buyer-id">������ ���̵�</label>
                    <input type="text" name="buyerId" value="${loginUser.userId}" id="buyer-id" readonly>
                </li>
                <li>
                    <label>���� ���</label>
                    <select name="paymentOption">
                        <c:forEach var="op" items="${paymentOptions}">
                            <option value="${op.code}">${op.paymentName}</option>
                        </c:forEach>
                    </select>
                </li>
                <li>
                    <label for="receiver-name">������ �̸�</label>
                    <input type="text" name="receiverName" value="${purchaseData.receiverName}" id="receiver-name">
                </li>
                <li>
                    <label for="receiver-phone">������ ����ó</label>
                    <input type="text" name="receiverPhone" value="${purchaseData.receiverPhone}" id="receiver-phone">
                </li>
                <li>
                    <label for="divy-addr">�����</label>
                    <input type="text" name="receiverAddr" value="${purchaseData.divyAddr}" id="divy-addr">
                </li>
                <li>
                    <label for="divy-request">���ſ�û����</label>
                    <input type="text" name="receiverRequest" value="${purchaseData.divyRequest}" id="divy-request">
                </li>
                <li>
                    <label>��� ��� ����</label>
                    <input type="text" name="divyDate" value="${purchaseData.divyDate}" id="divy-date" readonly>
                </li>
            </ul>
            <div class="btn-box">
                <button type="button" class="btn btn--submit">����</button>
                <button type="button" class="btn btn--cancel">���</button>
            </div>
        </form>
    </main>
</body>
</html>