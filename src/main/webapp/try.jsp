<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee Form</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
        <div>
            <a href="https://www.admin.net" class="navbar-brand"> Employee Management Application </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Employees</a></li>
        </ul>
    </nav>
</header>
<br/>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <% if (request.getAttribute("user") != null) { %>
                <form action="<%=request.getContextPath()%>/update" method="post">
            <% } else { %>
                <form action="<%=request.getContextPath()%>/insert" method="post">
            <% } %>

            <table>
                <caption>
                    <h2>
                        <% if (request.getAttribute("user") != null) { %>
                            Edit Employee
                        <% } else { %>
                            Add New Employee
                        <% } %>
                    </h2>
                </caption>

                <% if (request.getAttribute("user") != null) { %>
                    <input type="hidden" name="id" value="<%= ((Employee)request.getAttribute("user")).getId() %>" />
                <% } %>

                <tr>
                    <td>
                        <fieldset class="form-group">
                            <label>Employee Name</label>
                            <input type="text" value="<%= (request.getAttribute("user") != null) ? ((Employee)request.getAttribute("user")).getName() : "" %>" class="form-control" name="name" required="required">
                        </fieldset>
                    </td>
                </tr>

                <tr>
                    <td>
                        <fieldset class="form-group">
                            <label>Employee Designation</label>
                            <input type="text" value="<%= (request.getAttribute("user") != null) ? ((Employee)request.getAttribute("user")).getDesignation() : "" %>" class="form-control" name="designation">
                        </fieldset>
                    </td>
                </tr>

                <tr>
                    <td>
                        <fieldset class="form-group">
                            <label>Employee Salary</label>
                            <input type="text" value="<%= (request.getAttribute("user") != null) ? ((Employee)request.getAttribute("user")).getSalary() : "" %>" class="form-control" name="salary">
                        </fieldset>
                    </td>
                </tr>

                <tr>
                    <td>
                        <button type="submit" class="btn btn-success">Save</button>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
