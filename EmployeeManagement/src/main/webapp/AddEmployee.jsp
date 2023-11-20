<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.admin.employeemanagement.model.Employee" %>

<html>
<head>
    <title>Employee Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark"
            style="background-color: blue">
            <div>
                <a href="https://www.admin.net" class="navbar-brand"> Employee Management Application </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Employees</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <%
                    Object employeeObj = request.getAttribute("employee");
                    if (employeeObj != null) {
                        out.println("<form action='update' method='post'>");
                    } else {
                        out.println("<form action='insert' method='post'>");
                    }
                %>

                <caption>
                    <h2>
                        <%
                            if (employeeObj != null) {
                                out.println("Edit Employee");
                            } else {
                                out.println("Add New Employee");
                            }
                        %>
                    </h2>
                </caption>

                <%
                    if (employeeObj != null) {
                        out.println("<input type='hidden' name='id' value='" + ((Employee) employeeObj).getId() + "' />");
                    }
                %>

                <fieldset class="form-group">
                    <label>Name</label> <input type="text"
                        value="<%= employeeObj != null ? ((Employee) employeeObj).getName() : "" %>"
                        class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Designation</label> <input type="text"
                        value="<%= employeeObj != null ? ((Employee) employeeObj).getDesignation() : "" %>"
                        class="form-control" name="designation">
                </fieldset>

                <fieldset class="form-group">
                    <label>Salary</label> <input type="text"
                        value="<%= employeeObj != null ? ((Employee) employeeObj).getSalary() : "" %>"
                        class="form-control" name="salary">
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
