<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
        <p><a href="${pageContext.servletContext.contextPath}/user/view?id=${recipient.id}"><h5>Back to this user profile</h5></a>
        <form action="${pageContext.servletContext.contextPath}/user/send/message" method='POST'> <!-- форма кнопки Send -->
            <input type="hidden" name="recipientId" value="${recipient.id}"/>
            <p><input type="text" name="textMessage"/></p>
            <p><input type="submit" name="sendMessage" value="Send"/></p>
        </form>

    </div>
</div>
</body>
</html>