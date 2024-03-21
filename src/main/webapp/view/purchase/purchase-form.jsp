<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/purchase/purchaseForm.js"
            type="text/javascript"></script>

</head>

<body data-context-path="${pageContext.request.contextPath}">
    <c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
    <c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>

    <main>
        <div class="inner-header">
            <h2 class="page-title">��ǰ���</h2>
        </div>
        <form name="purchase">
            <ul>
                <li>
                    <label>������ ���̵�</label>
                    <input type="text" name="buyerId" value="${loginUser.userId}" readonly>
                </li>
                <li>
                    <label for="payment-option">���� ���</label>
                    <select name="paymentOption" id="payment-option">
                        <c:forEach var="po" items="${paymentOptions}">
                            <option value="${po.code}">${po.paymentName}</option>
                        </c:forEach>
                    </select>
                </li>
                <li>
                    <label for="receiver-name">������ �̸�</label>
                    <input type="text" name="receiverName" value="${loginUser.userName}" id="receiver-name"/>
                </li>
                <li>
                    <label for="receiver-phone">������ ����ó</label>
                    <input type="text" name="receiverPhone" value="${loginUser.phone}" id="receiver-phone"/>
                </li>
                <li>
                    <label for="address">�ּ�</label>
                    <input type="text" name="divyAddr" value="${loginUser.addr}" id="address">
                </li>
                <li>
                    <label for="divy-request">��� ��û����</label>
                    <input type="text" name="divyRequest" id="divy-request">
                </li>
                <li>
                    <label for="divy-date">����������</label>
                    <input type="text" name="divyDate" id="divy-date" readonly>
                </li>
            </ul>
            <p>��ü ${data.productCount} ���� ǰ��</p>
            <table>
                <thead>
                    <tr>
                        <th>��ǰ��ȣ</th>
                        <th>��ǰ��</th>
                        <th>��ǰ �� ����</th>
                        <th>��������</th>
                        <th>����</th>
                        <th>�������</th>
                        <th>����</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${data.productsToPurchase}">
                        <input type="hidden" name="tranProds" value="${product.key.prodNo}%DFS${product.value}">
                        <tr>
                            <td>${ product.key.prodNo }</td>
                            <td>${ product.key.prodName }</td>
                            <td>${ product.key.prodDetail }</td>
                            <td>${ product.key.manuDate }</td>
                            <td>${ product.key.price }</td>
                            <td>${ product.key.regDate }</td>
                            <td>${ product.value }</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
                <label>�Ѿ�</label>
                <p>${data.priceSum}</p>
            </div>
            <div>
                <label>�Ѽ���</label>
                <p>${data.quantitySum}</p>
            </div>
            <div class="btn-box">
				<button type="button" class="btn btn--submit">����</button>
				<button type="button" class="btn btn--cancel">���</button>
			</div>
        </form>
    </main>
</body>
</html>