<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userBaseInfo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userView.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/media.css" />
</head>
<body onload="setMarginMainContent()">
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
                        <li><a href="#">Отзывы</a></li>
                        <li><a href="#">Вопросы-ответы</a></li>
                        <li><a href="#">Форум</a></li>
                        <li><a href="#">Статьи</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="top_links">
                    <sec:authorize access="isAnonymous()">
                        <a href="${pageContext.servletContext.contextPath}/user/register" class="register_link">Регистрация</a> <!-- Логин и регистрация -->
                        <a href="${pageContext.servletContext.contextPath}/user/login" class="login_link">Вход</a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <button class="account_button"><i class="fa fa-user" aria-hidden="true"></i><i class="fa fa-play" aria-hidden="true"></i></button>
                        <div class="dropdown_account_menu" style="display:none">
                            <div class="dropdown_header">
                                Вошли как <strong>${currentUser.loginData.login}</strong>
                            </div>
                            <div class="dropdown_divider"></div>
                            <a class="dropdown_item" href="${pageContext.servletContext.contextPath}/user/${currentUser.loginData.login}">Мой профиль</a>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <a class="dropdown_item" href="${pageContext.servletContext.contextPath}/admin/panel">Aдмин панель</a>
                            </sec:authorize>
                            <a class="dropdown_item" href="${pageContext.servletContext.contextPath}/user/edit-profile">Настройки</a>
                            <a class="dropdown_item" href="">Помощь</a>
                            <div class="dropdown_divider"></div>
                            <a class="dropdown_item" href="${pageContext.servletContext.contextPath}/logout">Выйти</a>
                        </div>
                    </sec:authorize>
                </div>
            </div>
        </div>
    </div>
</nav>
<header class="main_header">
    <div class="contact_line">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <i class="fa fa-phone" aria-hidden="true"></i>
                    <span class="sp1">Многоканальный <br>телефон: </span> <span class="sp2">(495) 775-94-24</span></div>
                <div class="col-md-4">
                    <i class="fa fa-map-marker" aria-hidden="true"></i>
						<span>г. Казань,<br>
						Проектная улица , дом не существующий.</span>
                </div>
                <div class="col-md-4">
                    <input type="text" placeholder="Поиск по сайту">
                    <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</header>


<section class="main_content" id="main_content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="profile_head">
                    <div class="profile_link">
                        <img class="avatar" src="${pageContext.request.contextPath}/resources/img/user-photo.jpg" width="40" height="40" alt="">
                        <a href="" class="username">${ownerUser.userInfo.name} ${ownerUser.userInfo.surname} (${ownerUser.loginData.login})</a>
                    </div>
                    <div class="status_info">
                        Был менее 10 минут назад <br>
                        Зарегистрирован <fmt:parseDate value="${ownerUser.userInfo.registrationTime}" var="datetime"
                                                       pattern="yyyy-MM-dd HH:mm:ss" />
                        <fmt:formatDate value="${datetime}" pattern="dd/MM/yyyy HH:mm" />
                    </div>
                    <div class="head_links">
                        <div class="public_data">
                            <ul>
                                <li><a href="${pageContext.servletContext.contextPath}/user/${ownerUser.loginData.login}" class="active">Профиль</a></li>
                                <li><a href="">Комментарии</a></li><sub>64</sub>
                                <li><a href="">Топики</a></li><sub>4</sub>
                                <li><a href="">Статьи</a></li><sub>1</sub>
                                <c:if test="${myAccount==false}">
                                    <li><a href="${pageContext.servletContext.contextPath}/user/${ownerUser.loginData.login}/message" class="messages">Написать сообщение</a></li>
                                </c:if>
                                <sec:authorize access="isAuthenticated()">
                                    <c:if test="${isContact==false && myAccount==false}">
                                        <li><form action="${pageContext.servletContext.contextPath}/user/contact/add" method='POST'>
                                            <input type="hidden" name="id" value="${ownerUser.id}">
                                            <input type="submit" class="contacts" value="Добавить в список контактов"/>
                                        </form></li>
                                    </c:if>
                                </sec:authorize>
                            </ul>
                        </div>
                        <c:if test="${myAccount == true}">
                            <div class="private_data">
                                <div class="private_item1">
                                    <ul>
                                        <c:if test="${messagesNumber > 0}">
                                            <li><a href="${pageContext.servletContext.contextPath}/user/message-dialogs" class="messages">Мои сообщения (${messagesNumber})</a></li>
                                        </c:if>
                                        <c:if test="${contactsNumber > 0}">
                                            <li><a href="${pageContext.servletContext.contextPath}/user/contacts" class="contacts">Мои контакты (${contactsNumber})</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                                <div class="private_item2">
                                    <ul>
                                        <li><a href="${pageContext.servletContext.contextPath}/user/edit-profile" class="edit">Редактировать профиль</a></li>
                                        <li><a href="${pageContext.servletContext.contextPath}/logout" class="exit">Выход</a></li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="head">
                    <img class="avatar" src="${pageContext.request.contextPath}/resources/img/user-photo.jpg" width="120" height="120" alt="">
                    <b>${ownerUser.userInfo.name} ${ownerUser.userInfo.surname} (${ownerUser.loginData.login})</b>
                </div>
                <div class="user_info_wrap">
                    <div class="user_info_template">
                        <c:if test="${not empty ownerUser.loginData.email}">
                            <em>Email</em> <br>
                        </c:if>
                        <c:if test="${not empty ownerUser.userInfo.city}">
                            <em>Город</em> <br>
                        </c:if>
                        <c:if test="${not empty ownerUser.userInfo.phoneNumber}">
                            <em>Телефон</em> <br>
                        </c:if>
                        <c:if test="${not empty ownerUser.userInfo.sex}">
                            <em>Пол</em> <br>
                        </c:if>
                        <em>Сайты</em> <br>
                    </div>
                    <div class="user_info">
                        <c:if test="${not empty ownerUser.loginData.email}">
                            <span>${ownerUser.loginData.email}</span> <br>
                        </c:if>
                        <c:if test="${not empty ownerUser.userInfo.city}">
                            <span>${ownerUser.userInfo.city}</span> <br>
                        </c:if>
                        <c:if test="${not empty ownerUser.userInfo.phoneNumber}">
                            <span>${ownerUser.userInfo.phoneNumber}</span> <br>
                        </c:if>
                        <c:if test="${not empty ownerUser.userInfo.sex}">
                            <span>${ownerUser.userInfo.sex}</span> <br>
                        </c:if>
                        <span>Сайты</span>
                    </div>
                    <script type="text/javascript">
                        function setMarginMainContent() {
                            var length = document.getElementsByClassName('user_info').getElementsByTagName('span').length;
                            alert("test");
                            if(length < 5) {
                                document.getElementById('main_content').setAttribute("style",
                                        "margin-bottom:" + (155-length*30-15) + "px !important;");
                            }
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container">
        <div class="row ft_line">
            <div class="col-md-4">
                <div class="ft_left">
                    <a href="${pageContext.request.contextPath}/clinic/view">О клинике</a><br>
                    <a href="">Услуги</a><br>
                    <a href="">Магазин</a><br>
                    <a href="">Вопросы-ответы</a><br>
                    <a href="">Форум</a><br>
                    <a href="">Статьи</a><br>
                </div>
                <div class="ft_right">
                    <a href="">Акции</a><br>
                    <a href="">Доска объявлений</a><br>
                </div>
            </div>
            <div class="col-md-4">
                <div class="ft_contacts_wrap">
                    <h3>+7 (495) 775-94-24</h3>
						<span>
							г. Казань,<br>
							Проектная улица , дом не существующий. <br>
							<a href="">Карта проезда</a>
						</span>
                    support@zoovet.ru
                </div>
            </div>
            <div class="col-md-4">
                <a href="#"><i class="fa fa-vk" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a><br>
                <div class="newsletter">
                    <h4>Подписаться на рассылку</h4>
                    <input type="text" placeholder="Введите email">
                    <a href="#" class="ft_button_ok">OK</a>
                </div>
            </div>
        </div>
        <div class="row ft_rights ">
            <div class="col-md-12">
                © 2017 ВК "Зоовет". Все права защищены.
            </div>
        </div>
    </div>
</footer>


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
<!-- Yandex.Metrika counter --><!-- /Yandex.Metrika counter -->
<!-- Google Analytics counter --><!-- /Google Analytics counter -->
</body>
</html>