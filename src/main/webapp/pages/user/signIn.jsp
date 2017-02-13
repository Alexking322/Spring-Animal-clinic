<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--[if lt IE 7]><html lang="ru" class="lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html lang="ru" class="lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html lang="ru" class="lt-ie9"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="ru">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>Вход в Зоовет</title>
	<meta name="description" content="" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.jpeg" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/bootstrap/bootstrap-grid-3.3.1.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/font-awesome-4.2.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/fancybox/jquery.fancybox.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/owl-carousel/owl.carousel.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/countdown/jquery.countdown.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/media.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signIn.css" />
</head>
<body>
<header class="main_header">
	<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" alt="">
</header>
<section class="main_content">
	<div class="auth_form">
		<div class="auth_form_header">
			<h1>Войти на Зоовет</h1>
		</div>
		<form name="form_login" action="<c:url value="/j_spring_security_check"/>" id="loginForm" method='POST'>
			<div class="auth_form_body">
				<label for="login_field">Имя пользователя или email</label>
				<input type="text" name="user_login" class="form_control" id="login_field">
				<label for="password_field">Пароль
					<a href="" class="forgot_pass_link">Забыли пароль ?</a></label>
				<input type="password" name="user_password" class="form_control" id="password_field">
				<input type="submit" class="btn" value="Войти">
			</div>
		</form>
		<c:if test="${not empty error}">
			<div style="color:red">${error}</div>
		</c:if>
		<p class="create_account_callout">
			Новичек в Зоовет ?
			<a href="${pageContext.servletContext.contextPath}/user/register">Создать учетную запись</a>
		</p>
	</div>
</section>
<div class="footer">
	<ul>
		<li><a href="${pageContext.request.contextPath}/clinic/view">О клинике</a></li>
		<li><a href="">Услуги</a></li>
		<li><a href="">Форум</a></li>
		<li><a href="">Статьи</a></li>
	</ul>
</div>


<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/resources/libs/html5shiv/es5-shim.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/html5shiv/html5shiv.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/html5shiv/html5shiv-printshiv.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/respond/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/resources/libs/jquery/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/jquery-mousewheel/jquery.mousewheel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/fancybox/jquery.fancybox.pack.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/waypoints/waypoints-1.6.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/scrollto/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/owl-carousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/countdown/jquery.plugin.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/countdown/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/countdown/jquery.countdown-ru.js"></script>
<script src="${pageContext.request.contextPath}/resources/libs/landing-nav/navigation.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/signIn.js"></script>
<!-- Yandex.Metrika counter --><!-- /Yandex.Metrika counter -->
<!-- Google Analytics counter --><!-- /Google Analytics counter -->
</body>
</html>