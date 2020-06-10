<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        <%@ page isErrorPage="true" %>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row my-2 justify-content-end">
                <div class="col-1">
                    <form:form action="/languages/${language.id}" method="POST">
                		<input type="hidden" name="_method" value="delete">
                		<input class="btn btn-link" type="submit" value="Delete">
                	</form:form>
                </div>
                <div class="col-1">
                    <a href="/languages">Dashboard</a>
                </div>
            </div>
            <form:form action="/languages/${language.id}" method="post" modelAttribute="language">
            	<input type="hidden" name="_method" value="put">
                <div class="row my-2">
                    <div class="col-5">Name</div>
                    <form:input path="name" type="text" name="name" value="${language.name}" class="col-5"/>
                    <form:errors path="name" class="col-2 text-danger"/>
                </div>
                <div class="row my-2">
                    <div class="col-5">Creator</div>
                    <form:input path="creator" type="text" name="creator" value="${language.creator }" class="col-5"/>
                    <form:errors path="creator" class="col-2 text-danger"/>
                </div>
                <div class="row my-2">
                    <div class="col-5">Version</div>
                    <form:input path="version" type="text" name="version" value="${language.version }" class="col-5"/>
                    <form:errors path="version" class="col-2 text-danger"/>
                </div>
                <div class="row justify-content-end">
                    <div class="col-1">
                        <Button type="submit" class="btn btn-primary text-end">Submit</Button>
                    </div>
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