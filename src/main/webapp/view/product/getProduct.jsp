<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>
</head>

<body bgcolor="#ffffff" text="#000000">

		<table width="100%" height="37" border="0" cellpadding="0"
               cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
                                                width="15" height="37"></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
                    style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
                                                width="12" height="37"/></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
               style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��ǰ��ȣ <img
                        src="${pageContext.request.contextPath}/images/ct_icon_red.gif" width="3" height="3"
                        align="absmiddle"/>
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">${ productData.prodNo }</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��ǰ�� <img
                        src="${pageContext.request.contextPath}/images/ct_icon_red.gif" width="3" height="3"
                        align="absmiddle"/>
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${ productData.prodName }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��ǰ�̹��� <img
                        src="${pageContext.request.contextPath}/images/ct_icon_red.gif" width="3" height="3"
                        align="absmiddle"/>
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<img src="/images/uploadFiles/${ productData.fileName }" alt="No image"/>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">
					��ǰ������
					<img src="${pageContext.request.contextPath}/images/ct_icon_red.gif"
                         width="3"
                         height="3"
                         align="absmiddle"/>
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${ productData.prodDetail }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��������</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${ productData.manuDate }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">����</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${ productData.price }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�������</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${ productData.regDate }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
               style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">

					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
                            <c:if test="${ productData.purchasable }">
                                <td width="17" height="23"><img src="/images/ct_btnbg01.gif"
                                                                width="17" height="23"/></td>
                                <td background="/images/ct_btnbg02.gif"
                                    class="ct_btn01"
                                    style="padding-top: 3px;">

									<form action="${pageContext.request.contextPath}/cart/items/new" method="POST">
										<input type="hidden" name="prodNo" value="${ productData.prodNo }">
										<input type="number" name="quantity" id="quantityInput" value="0">
										<input type="submit" id="loadOnCart" value="��ٱ���" disabled>
									</form>
								</td>
                                <td width="14"
                                    height="23">

									<img src="/images/ct_btnbg03.gif"
                                         width="14"
                                         height="23">
								</td>
                            </c:if>

							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
                                                            width="17" height="23"/></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
                                style="padding-top: 3px;"><a
                                    href="javascript:history.go(-1)">����</a></td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
                                                            width="14" height="23"></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>

<script>
	const quantityInput = document.getElementById("quantityInput");
	const loadOnCart = document.getElementById("loadOnCart");
	quantityInput.addEventListener("change", ev => {
		loadOnCart.disabled = parseInt(ev.target.value) <= 0;
	});
</script>

</body>
</html>