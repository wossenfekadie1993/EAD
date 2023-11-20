<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.admin.employeemanagement.model.Employee" %>

<html>
<head>
    <title>Add Employee</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark"
            style="background-color: gray">
            <div>
                <a href="<%=request.getContextPath()%>/list" class="navbar-brand"> Employee Management Application </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Employees</a></li>
            </ul>
        </nav>
    </header>
    <br>

    <div class="row">
        <div class="container">
            <h3 class="text-center">Edit Employee</h3>
            <hr>
            <form action="<%=request.getContextPath()%>/update" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="designation">Designation:</label>
                    <input type="text" class="form-control" id="designation" name="designation" required>
                </div>
                <div class="form-group">
                    <label for="salary">Salary:</label>
                    <input type="text" class="form-control" id="salary" name="salary" required>
                </div>
                <button type="submit" class="btn btn-secondary">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
