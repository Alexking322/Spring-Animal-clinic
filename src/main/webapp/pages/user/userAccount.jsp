<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>My profile</title>
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
        <p>
            Name: <b>${user.userInfo.name}</b>
        </p>
        <p>
            Surname: <b>${user.userInfo.surname}</b>
        </p>
        <p>
            Login: <b>${user.loginData.login}</b>
        </p>
        <p>
            Email: <b>${user.loginData.email}</b>
        </p>
        <p>
            Sex: <b>${user.userInfo.sex}</b>
        </p>
        <p>
            Phone number: <b>${user.userInfo.phoneNumber}</b>
        </p>
        <p>
            City: <b>${user.userInfo.city}</b>
        </p>
        <fmt:parseDate value="${user.userInfo.registrationTime}" var="datetime"
                       pattern="yyyy-MM-dd HH:mm:ss" />
        <p>Registration date: <b><fmt:formatDate value="${datetime}" pattern="dd/MM/yyyy HH:mm" /></b></p>

        <a href="${pageContext.servletContext.contextPath}/user/account/contacts">My contacts</a><br>
        <p>
            <a href="${pageContext.servletContext.contextPath}/user/edit">Edit my profile</a>
        </p>
    </div>
</div>
</body>
</html>
