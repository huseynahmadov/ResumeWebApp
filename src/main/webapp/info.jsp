<%@ page import="com.company.dao.inter.UserDaoInter" %>
<%@ page import="com.company.entity.User" %>
<%@ page import="com.company.main.Context" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Huseyn
  Date: 3/14/2021
  Time: 1:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/ba232c0995.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/users.css">
    <title>Info</title>
</head>
 <body>
<%

    User u = (User) request.getAttribute("user");

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
<div>
    <table class="table">
        <thead>
        <tr>
            <th>name</th>
            <th>surname</th>
            <th>nationality</th>
            <th>email</th>
            <th>Birth Date</th>
            <th>Birth Place</th>
            <th>Phone</th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <td><%=u.getName()%></td>
            <td><%=u.getSurname()%></td>
            <td><%=u.getNationality().getName()==null?"N/A":u.getNationality().getName()%></td>
            <td><%=u.getEmail()%></td>
            <td><%=u.getBirthDate()%></td>
            <td><%=u.getBirthPlace().getName()==null?"N/A":u.getBirthPlace().getName()%></td>
            <td><%=u.getPhone()%></td>
 </body>
</html>
