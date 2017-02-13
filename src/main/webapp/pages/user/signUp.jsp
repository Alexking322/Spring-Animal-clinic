<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<!--[if lt IE 7]><html lang="ru" class="lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html lang="ru" class="lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html lang="ru" class="lt-ie9"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="ru">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>Ветеринарная клиника</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signUp.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/media.css" />
</head>
<body>
<nav class="nav_panel">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="logo_wrap">
                    <img src="${pageContext.request.contextPath}/resources/img/logo.jpg" alt="" width="250px">
                </div>
            </div>
            <div class="col-md-6">
                <div class="main_menu clearfix">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/clinic/view">О клинике</a></li>
                        <li><a href="#">Услуги</a></li>
                        <li><a href="#">Магазин</a></li>
                        <li><a href="#">Вопросы-ответы</a></li>
                        <li><a href="#">Форум</a></li>
                        <li><a href="#">Статьи</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="top_links">
                    <a href="${pageContext.servletContext.contextPath}/user/register" class="register_link">Регистрация</a> <!-- Логин и регистрация -->
                    <a href="${pageContext.servletContext.contextPath}/user/login" class="login_link">Вход</a>
                </div>
            </div>
        </div>
    </div>
    </div>
</nav>
<div class="register_content_wrap">
    <div class="register_content_header">
        <h1>Присоединяйтесь к Зоовет.</h1>
        <p>Лучшее лечение ваших питомцев.</p>
    </div>
    <div class="register_content_main">
        <div class="register_form_container">
            <form action="${pageContext.servletContext.contextPath}/user/new" method='POST' id="register_form" class="register_form">
                <h4>Создайте вашу личную учетную запись</h4>
                <div class="form_group">
                    <label for="user_login">Логин</label>
                    <input type="text" name="login" id="user_login">
                    <p class="note">Это будет ваше имя пользователя.</p>
                </div>
                <div class="form_group">
                    <label for="user_email">Email адрес</label>
                    <input type="text" name="email" id="user_email">
                    <p class="note">Время от времени вы будете получать почтовую рассылку от нашей клиники.</p>
                </div>
                <div class="form_group">
                    <label for="user_name">Имя</label>
                    <input type="text" name="name" id="user_name">
                    <p class="note">Ваше имя.</p>
                </div>
                <div class="form_group">
                    <label for="user_surname">Фамилия</label>
                    <input type="text" name="surname" id="user_surname">
                    <p class="note">Ваша фамилия.</p>
                </div>
                <div class="form_group">
                    <label for="user_password">Пароль</label>
                    <input type="password" name="password" id="user_password">
                    <p class="note">Используйте по крайней мере шесть символов.</p>
                </div>
                <input type="submit" value="Зарегистрироваться">
                <c:if test="${not empty register_error}">
                    <div style="color:red">${register_error}</div>
                </c:if>
            </form>
        </div>
        <div class="register_secondary_container">
            <h4>После регистрации вы сможете: </h4>
            <ul>
                <li>
                    <i class="fa fa-check" aria-hidden="true"></i>
                    консультироватся
                </li>
                <li>
                    <i class="fa fa-check" aria-hidden="true"></i>
                    общаться на форуме
                </li>
                <li>
                    <i class="fa fa-check" aria-hidden="true"></i>
                    вызвать врача онлайн
                </li>
                <li>
                    <i class="fa fa-check" aria-hidden="true"></i>
                    узнать много нового
                </li>
                <li>
                    <i class="fa fa-check" aria-hidden="true"></i>
                    узнавать новости клиники
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="solution"></div>
<div class="footer">
    <ul>
        <li><a href="">О клинике</a></li>
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
<script src="${pageContext.request.contextPath}/resources/js/signUp.js"></script>
<!-- Yandex.Metrika counter --><!-- /Yandex.Metrika counter -->
<!-- Google Analytics counter --><!-- /Google Analytics counter -->
</body>
</html>
