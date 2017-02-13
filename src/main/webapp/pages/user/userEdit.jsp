<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Edit user</title>
    <link rel="stylesheet" type="text/css" href="../css/baseStyle.css"/>
</head>
<body>
<div class="main">
    <div class="header">
        <a href="${pageContext.servletContext.contextPath}/clinic/view"><img src="..\images\clinicHeader.png"/></a>
    </div>
    <div class="menu">
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
        <form action="${pageContext.servletContext.contextPath}${urlEdit}" method='POST'> <!-- форма кнопки Edit -->
            <input type='hidden' name='id' value="${user.id}"/>
            <input type='hidden' name='email' value="${user.userInfo.email}"/>
            <p>Name:
                <input type='text' name='name' value="${user.userInfo.name}" id="name"/></p>
            <p>Surname:
                <input type='text' name='surname' value="${user.userInfo.surname}"/></p>
            <p>Sex:
                <input type='text' name='sex' value="${user.userInfo.sex}"/></p>
            <p>Phone number:
                <input type='text' name='phoneNumber' value="${user.userInfo.phoneNumber}"/></p>
            <p>City:
                <input type='text' name='city' value="${user.userInfo.city}"/>
            </p>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <select name="roleName">
                    <option value='ROLE_USER'>User</option>
                    <option value='ROLE_MANAGER'>Manager</option>
                </select>
            </sec:authorize>
            <input type='submit' value="Edit"/>
        </form>
    </div>
</div>
</body>
</html>
