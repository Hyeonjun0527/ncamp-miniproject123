<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>

<body>

    <form name="updatePurchase" action="/updatePurchaseView.do?tranNo=0" method="post">

        ������ ���� ���Ű� �Ǿ����ϴ�.

        <table border=1>
            <tr>
                <td>�����ھ��̵�</td>
                <td>${ purchaseData.buyerId }</td>
                <td></td>
            </tr>
            <tr>
                <td>���Ź��</td>
                <td>${ purchaseData.paymentOption }</td>
                <td></td>
            </tr>
            <tr>
                <td>�������̸�</td>
                <td>${ purchaseData.receiverName }</td>
                <td></td>
            </tr>
            <tr>
                <td>�����ڿ���ó</td>
                <td>${ purchaseData.receiverPhone }</td>
                <td></td>
            </tr>
            <tr>
                <td>�������ּ�</td>
                <td>${ purchaseData.divyAddr }</td>
                <td></td>
            </tr>
            <tr>
                <td>���ſ�û����</td>
                <td>${ purchaseData.divyRequest }</td>
                <td></td>
            </tr>
            <tr>
                <td>����������</td>
                <td>${ purchaseData.divyDate }</td>
                <td></td>
            </tr>
        </table>

        <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top: 13px;">
            <tr>
                <th class="ct_write">
                    ��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
                </th>
                <th class="ct_write">
                    ����
                </th>
            </tr>

            <c:forEach var="tranProd" items="${purchaseData.transactionProductions}">
            <tr>
                <td class="ct_write01">${ tranProd.product.prodNo }</td>
                <td class="ct_write01">${ tranProd.quantity }</td>
            </tr>
            </c:forEach>
        </table>
    </form>

</body>
</html>