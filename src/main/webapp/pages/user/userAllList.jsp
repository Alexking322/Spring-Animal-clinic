<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Foreign user</title>
    <link rel="stylesheet" type="text/css" href="../css/baseStyle.css"/>
</head>
<body>
<div class="main">
    <div class="header">
        <a href="${pageContext.servletContext.contextPath}/clinic/view"><img src="..\images\clinicHeader.png"/></a>
    </div>
    <div class="menu">
        <sec:authorize access="isAnonymous()">
            <a href="${pageContext.servletContext.contextPath}/user/register">Sign up</a> <!-- Логин и регистрация -->
            <a href="${pageContext.servletContext.contextPath}/user/login">Sign in</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <a href="${pageContext.servletContext.contextPath}/user/account">My profile</a>
            <a href="${pageContext.servletContext.contextPath}/user/account/dialogs">Messages</a>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="${pageContext.servletContext.contextPath}/admin/panel">Admin panel</a>
            </sec:authorize>
            <a href="${pageContext.servletContext.contextPath}/logout">Exit</a>
        </sec:authorize>
    </div>

    <div class="content">
        <c:if test="${not empty users}">
        <h2>All users: </h2> <!-- Результаты поиска с таблицой -->
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Sex</th>
                <th>Phone number</th>
                <th>City</th>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                <th>Actions</th>
                </sec:authorize>
            </tr>
            <c:forEach items="${users}" var="user" varStatus="status">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.userInfo.name}</td>
                    <td>${user.userInfo.surname}</td>
                    <td>${user.userInfo.sex}</td>
                    <td>${user.userInfo.phoneNumber}</td>
                    <td>${user.userInfo.city}</td>
                    <td>
                        <a href="${pageContext.servletContext.contextPath}/user/view?id=${user.id}">View profile</a>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <a href="${pageContext.servletContext.contextPath}/admin/edit/user?id=${user.id}">Edit profile</a>
                            <a href="${pageContext.servletContext.contextPath}/admin/delete/user?id=${user.id}">Delete profile</a>
                        </sec:authorize>
                    </td>
                </tr>
            </c:forEach>
        </table>
        </c:if>
        <c:if test="${empty users}">
            Users not registered in the clinic
        </c:if>
    </div>
</div>
</body>
</html>