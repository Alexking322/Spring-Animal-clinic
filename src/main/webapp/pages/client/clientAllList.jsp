<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Client all list</title>
    <link rel="stylesheet" type="text/css" href="../css/baseStyle.css"/>
</head>
<body>
<div class="main">
    <div class="header">
        <a href="${pageContext.servletContext.contextPath}/clinic/view"><img src="..\images\clinicHeader.png"/></a>
    </div>
    <div class="menu">
        Add a new client:
        <form action="${pageContext.servletContext.contextPath}/client/add" method='GET'> <!-- форма кнопки Добавить клиента -->
            <input type='submit' name = 'addClient' value="" class="addButton"/>
        </form>
        <a href="${pageContext.servletContext.contextPath}/user/account">My profile</a>
        <a href="${pageContext.servletContext.contextPath}/user/account/dialogs">Messages</a>
        <a href="${pageContext.servletContext.contextPath}/admin/panel">Admin panel</a>
        <a href="${pageContext.servletContext.contextPath}/logout">Exit</a>
    </div>

    <div class="context">
        <c:if test="${not empty clients}">
            <h3>List of clients: </h3>
            <table> <!-- Таблица всех клиентов -->
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Email</th>
                    <th>Sex</th>
                    <th>Phone number</th>
                    <th>City</th>
                    <th>Registration time</th>
                    <th>Actions</th>
                </tr>

                <c:forEach items="${clients}" var="client" varStatus="status">
                    <tr>
                        <td>${client.id}</td>
                        <td>${client.name}</td>
                        <td>${client.surname}</td>
                        <td>${client.email}</td>
                        <td>${client.sex}</td>
                        <td>${client.phoneNumber}</td>
                        <td>${client.city}</td>
                        <fmt:parseDate value="${client.registrationTime}" var="datetime"
                                       pattern="yyyy-MM-dd HH:mm:ss" />
                        <td><fmt:formatDate value="${datetime}" pattern="dd/MM/yyyy HH:mm" /></td>
                        <td>
                            <a href="${pageContext.servletContext.contextPath}/client/edit?id=${client.id}">Edit</a>
                            <a href="${pageContext.servletContext.contextPath}/client/delete?id=${client.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
