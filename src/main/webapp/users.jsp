<%--
    Document   : user
    Created on : Mar 8, 2021, 3:26:16 PM
    Author     : Huseyn
--%>

<%@page import="com.company.dao.inter.UserDaoInter" %>
<%@page import="com.company.entity.User" %>
<%@page import="com.company.main.Context" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/ba232c0995.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/users.css">
    <title>Demo site</title>
</head>
<body>
<%
    UserDaoInter userDao = Context.instanceUserDao();

    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String nationalityIdStr = request.getParameter("nid");
    Integer nationalityId = null;

    if (nationalityIdStr != null && !nationalityIdStr.trim().isEmpty()) {
        nationalityId = Integer.parseInt(nationalityIdStr);
    }

    List<User> list = userDao.getAll(name, surname, nationalityId);
%>
<div class="container">
    <div class="mycontainer">
    <div action="users.jsp" method="GET">
        <div class= "form-group">
        <label for="name">name:</label>
        <input placeholder="Enter name" class="form-control" type="text" name="name" value=""/>
    </div>
        <div>
        <label for="surname">surname:</label>
        <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
            <br>
            <input class="btn btn-primary" type="submit"  name="search" value="Search"/>

        </div>

    </form>
    </div>
</div>

<div>
    <table class="table">
        <thead>
        <tr>
            <th>name</th>
            <th>surname</th>
            <th>nationality</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (User u : list) {
        %>
        <tr>
            <td><%=u.getName()%></td>
            <td><%=u.getSurname()%></td>
            <td><%=u.getNationality().getName()==null?"N/A":u.getNationality().getName()%></td>
            <td style="width: 1px">

                <form action="userdetails" method="POST">
                    <input type="hidden" name="id" value="<%=u.getId()%>"/>
                    <input type="hidden" name="action" value="delete"/>
                    <button class="btn btn-danger" type="submit" value="delete">
                    <i class="fas fa-trash-alt"></i>
                    </button>
                </form>



            </td>
            <td style="width: 1px">
                <form action="userdetails" method="GET">
                    <input type="hidden" name="id" value="<%=u.getId()%>"/>
                    <input type="hidden" name="action" value="update"/>
                    <button class="btn btn-secondary" type="submit"  value="update">
                        <i class="fas fa-pen-square"></i>
                    </button>
                </form>

            </td>
            <td style="width: 1px">
                <button class="btn btn-info"  name="action" value="info">
                    <i class="fas fa-info-circle"></i>
                </button>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
</div>
</body>
</html>
