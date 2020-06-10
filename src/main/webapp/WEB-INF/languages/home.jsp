<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row my-2">
                <table class="table table-bordered">
                    <thead>
                        <th>Name</th>
                        <th>Creator</th>
                        <th>Version</th>
                        <th>Action</th>
                    </thead>
                    <tbody>
                    	<c:forEach items="${languages}" var="lang">
                    		<tr>
	                            <td>${lang.name}</td>
	                            <td>${lang.creator}</td>
	                            <td>${lang.version}</td>
	                            <td>
	                            	<div class="row">
	                            		<form:form action="/languages/${lang.id}" method="POST">
		                            		<input type="hidden" name="_method" value="delete">
		                            		<input class="btn btn-link" type="submit" value="Delete" />
		                            	</form:form>
		                            	<a href="/languages/${lang.id}/edit">Edit</a>
	                            	</div>
	                            </td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            <form:form action="/languages" method="POST" modelAttribute="language">
                <div class="row my-2">
                    <form:label path="name" class="col-5">Name</form:label>
                    <form:input path="name" class="col-5" type="text"/>
                    <form:errors path="name" class="col-2 text-danger"/>
                </div>
                <div class="row my-2">
                    <div class="col-5">Creator</div>
                    <form:input path="creator" class="col-5" type="text" name="creator"/>
                    <form:errors path="creator" class="col-2 text-danger"/>
                </div>
                <div class="row my-2">
                    <div class="col-5">Version</div>
                    <form:input path="version" class="col-5" type="text" name="version"/>
                    <form:errors path="version" class="col-2 text-danger"/>
                </div>
                <div class="row my-2">
                    <button class="btn btn-primary" type="submit">Submit</button>
                </div>
            </form:form>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>