
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:url var="addAction" value="/product/add" ></c:url>

<form:form action="${addAction}" modelAttribute="products">
<table>

	<tr>
		<td>
			<form:label path="productId">
				<spring:message text="productId"/>
			</form:label>
		</td>
		<td>
			<form:input path="productId" />
		</td>
	</tr>
       <tr>
		<td>
			<form:label path="productName">
				<spring:message text="productName"/>
			</form:label>
		</td>
		<td>
			<form:input path="productName" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="productPrice">
				<spring:message text="productPrice"/>
			</form:label>
		</td>
		<td>
			<form:input path="productPrice" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="productQuality">
				<spring:message text="productQuality"/>
			</form:label>
		</td>
		<td>
			<form:input path="productQuality" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="productDescription">
				<spring:message text="productDescription"/>
			</form:label>
		</td>
		<td>
			<form:input path="productDescription" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="productColor">
				<spring:message text="productColor"/>
			</form:label>
		</td>
		<td>
			<form:input path="productColor" />
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			
			
				<input type="submit"
					value="<spring:message text="ProductAdd"/>" />
			
		</td>
	</tr>
</table>	
</form:form>

<br>
<h3>product LIST</h3>
<c:if test="${!empty list}">
	<table class="" border="1">
	<tr>
		<th>Product ID</th>
		<th>Product Name</th>
		<th>ProductPrice</th>
		<th>ProductQuality</th>
		<th>ProductDescription</th>
		<th>ProductColor</th>
		
		<th>Edit</th>
		<th>Delete</th>
		
	</tr>
	<c:forEach items="${list}" var="lists">
		<tr>
			<td>${lists.productId}</td>
			<td>${lists.productName}</td>
			<td>${lists.productPrice}</td>
			<td>${lists.productQuality}</td>
			<td>${lists.productDescription}</td>
			<td>${lists.productColor}</td>
			
			<td><a href="<c:url value='/edit/${lists.productId}'/>" >Edit</a></td>
			<td><a href="<c:url value='/remove/${lists.productId}' />" >Delete</a></td>
			
		</tr>
	</c:forEach>
	</table>
</c:if>

</body>
</html>
