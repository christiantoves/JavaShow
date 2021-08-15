<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title><c:out value="${book.title}"></c:out></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	</head>
	<body>
		<h1><c:out value="${book.title}"></c:out></h1>
        <p>Description: <c:out value="${book.description}"></c:out></p>
        <p>Language: <c:out value="${book.language}"></c:out></p>
        <p>Number of Pages: <c:out value="${book.numberOfPages}"></c:out></p>
        <a href="/books/${book.id}/edit">Edit Book</a>
        <form action="/books/${book.id}" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete">
		</form>
	</body>
</html>