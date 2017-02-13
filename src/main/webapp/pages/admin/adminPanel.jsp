<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Admin panel</title>
    <link rel="stylesheet" type="text/css" href="../css/baseStyle.css"/>
</head>
<body>
<div class="main">
    <div class="header">
        <a href="${pageContext.servletContext.contextPath}/clinic/view"><img src="..\images\clinicHeader.png"/></a>
    </div>
    <div class="menu">
        <a href="${pageContext.servletContext.contextPath}/user/account">My profile</a>
        <a href="${pageContext.servletContext.contextPath}/user/account/dialogs">Messages</a>
        <a href="${pageContext.servletContext.contextPath}/admin/panel">Admin panel</a>
        <a href="${pageContext.servletContext.contextPath}/logout">Exit</a>
    </div>

    <div class="content">
        <p>
        <a href="${pageContext.servletContext.contextPath}/client/add">Add new client</a></br>
        <a href="${pageContext.servletContext.contextPath}/client/view/all">View all clients</a></br>
        <a href="${pageContext.servletContext.contextPath}/user/register">Add new user</a></br>
        <a href="${pageContext.servletContext.contextPath}/user/view/all">View all users</a></br>
        </p>
    </div>
</div>
</body>
</html>
