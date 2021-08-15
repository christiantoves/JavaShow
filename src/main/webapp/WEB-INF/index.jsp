<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>All Books</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	</head>
	<body>
		<h1>All Books</h1>
		<table>
		    <thead>
		        <tr>
		            <th>Title</th>
		            <th>Description</th>
		            <th>Language</th>
		            <th>Number of Pages</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${books}" var="book">
			        <tr>
			            <td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
			            <td><c:out value="${book.description}"/></td>
			            <td><c:out value="${book.language}"/></td>
			            <td><c:out value="${book.numberOfPages}"/></td>
			        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		<a href="/books/new">New Book</a>
	</body>
</html>