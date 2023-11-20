<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.admin.employeemanagement.model.Employee" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Employee Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        /* Add your custom styles here */
        body {
            background-color: #f8f9fa; /* Bootstrap background color */
        }
        .navbar {
            background-color: #343a40; /* Bootstrap dark gray */
        }
        .container {
            margin-top: 20px;
        }
        .text-gray {
            color: gray;
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark">
        <div>
            <a href="https://www.admin.net" class="navbar-brand">Employee Management Application</a>
        </div>
        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Employees</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <div class="container">
        <h3 class="text-center text-gray">List of Employees</h3>
        <hr>
        <br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Designation</th>
                    <th>Salary</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Employee> listEmployee = (List<Employee>)request.getAttribute("listEmployee");
                if (listEmployee != null && !listEmployee.isEmpty()) {
                    for (Employee employee : listEmployee) {
                %>
                    <tr>
                        <td><%= employee.getId() %></td>
                        <td><%= employee.getName() %></td>
                        <td><%= employee.getDesignation() %></td>
                        <td><%= employee.getSalary() %></td>
                        <td>
                            <a href="<%=request.getContextPath()%>/edit?id=<%= employee.getId() %>" class="btn btn-primary">Edit</a>
                            <a href="<%=request.getContextPath()%>/delete?id=<%= employee.getId() %>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                <% 
                    }
                } else {
                %>
                    <tr>
                        <td colspan="5" class="text-center text-gray">No employees found</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="container text-left">
            <a href="<%=request.getContextPath()%>/new" class="btn btn-secondary">Add New Employee</a>
        </div>
    </div>
</div>

</body>
</html>
