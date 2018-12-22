<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
			input[class="cb1"] + label {
				display: inline-block;
				width: 20px;
				height: 20px;
				border: 2px solid #bcbcbc;
				cursor: pointer;
			}
			input[class="cb1"]:checked + label {
				background-color: #666666;
			}
			input[class="cb1"] {
				display: none;
			}
			
			
		</style>

</head>
<body>
	<h1>장바구니 확인</h1>
<%-- 	<jsp:include page="../gnb/header.jsp" flush="true" /> --%>
	<c:choose>
		<c:when test="${cartList.size() > 0 }">
		<table>
			<thead>
				<tr> </tr>
				<tr>상품명</tr>
				<tr>수량</tr>
				<tr>상품가격</tr>
			</thead>	
			<c:forEach var="items" items="${cartList}">
			<tbody>
				<td><input type="checkbox" id="${items.menuId}" class="cb1">
				<label for="${items.menuId}"></label>
				</td>
				<td>${items.menuName}</td>
				<td>${items.amount} 
				<a href="Pcartchange?code=${items.menuId}"><button>+</button></a> 
				<c:choose>
				<c:when test="${items.amount == 1 }">
				<a href="#"><button>-</button></a>
				</c:when>
				<c:otherwise>
				<a href="Mcartchange?code=${items.menuId}"><button>-</button></a>
				</c:otherwise>
				</c:choose>
				</td>
				
				<td>${items.menuPrice * items.amount}원</td>
				<td><a href="itemDelete?code=${items.menuId}"><button>삭제</button></a></td>
			</tbody>
			<c:set var="sum" value="${sum +  items.menuPrice * items.amount}"/>
			</c:forEach>
			<td>합계 : <c:out value="${sum}"/></td>
		</table>
		</c:when>
		
		<c:otherwise>
			<div>
				<p>등록된 상품이 없습니다.</p>
			</div>
		</c:otherwise>
	</c:choose>
	<a href="#"><button>주문하기</button></a> 
	<a href="menu/list"><button>계속쇼핑하기</button></a>
</body>
</html>