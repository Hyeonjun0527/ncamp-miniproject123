<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

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
                <td>��ǰ��ȣ</td>
                <td>${ purchaseData.purchaseProd.prodNo }</td>
                <td></td>
            </tr>
            <tr>
                <td>�����ھ��̵�</td>
                <td>${ purchaseData.buyer.userId }</td>
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
    </form>

</body>
</html>