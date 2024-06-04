<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jung.Dessert" isELIgnored="false" %>
<jsp:useBean id="id" class="jung.DessertRepository" scope="session" />
<%--<%@ page errorPage="exceptionNoName.jsp" %> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
	<style>
	img
	{width:100%; height:100%; border-radius:10px;}
	.all
	{margin:10px; padding:20px; box-shadow: 5px 5px 10px #ccc, inset -5px -5px 20px #fff; border-radius:10px;}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function addToCart(){
			if (confirm("장바구니에 추가하시겠습니까?")) {
				document.addForm.submit();
				console.log();
			} else {
				document.addForm.reset();
			}
		}
	</script>
</head>
<body>
		<%@ include file="header.jsp" %>
		
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">제품정보</h1>
		</div>
	</div>
		<%
			String number=request.getParameter("number");
			DessertRepository create=DessertRepository.getInstance();
			Dessert dessert= create.getDessertByNumber(number);
		%>
		<div class="all">
		<div class="row align-items-md-stretch">
				<div class="imgbox col-md-6">
						<img src="../resources/images/<%=dessert.getFilename()%> " style="width:70%">
					</div>
				<div class="infobox col-md-6">
					<h3><b><%=dessert.getName()%></b></h3>
					<p><%=dessert.getDescription()%></p>
					<p><b>제품번호</b> :<%=dessert.getNumber() %>
					<p><b>분류</b> :<%=dessert.getCategory() %>
					<p><b>재고</b> :<%=dessert.getStock() %>
					<p><b>알레르기</b> :<%=dessert.getAllergy() %>
					<p><b>원산지</b> :<%=dessert.getOrigin() %>				
					<p><b>가격</b> :<%=dessert.getPrice() %>원</p>
					<p><form name="addForm" action="./addCart.jsp?number=<%=dessert.getNumber() %>" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">주문하기</a>
						<a href="./cart.jsp" class="btn btn-warning">장바구니</a> 
						<a href="./sell.jsp" class="btn btn-secondary">돌아가기</a>
					</form>
				</div>			
		</div>
		</div>
		<br>
	<%@ include file="footer.jsp"%>
</body>
</html>