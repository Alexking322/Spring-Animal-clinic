<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/clinicView.css" />
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
                                Вошли как <strong>${user.loginData.login}</strong>
                            </div>
                            <div class="dropdown_divider"></div>
                            <a class="dropdown_item" href="${pageContext.servletContext.contextPath}/user/${user.loginData.login}">Мой профиль</a>
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
    <div class="promotions">
        <div class="container">
            <div class="row">
                <div class="col-md-6"><img src="${pageContext.request.contextPath}/resources/img/header.png" alt=""></div>
                <div class="col-md-5">
                    <div class="promotions_text">
                        <h1>Зоовет маркет дарит<br> полезные подарки</h1>
							<span>
								При покупке от 1200 рублей, вы сами выбираете <br>
								сертификат Java. Акция распространяется при покупке <br>
								курсов, лакомств, аксессуаров и ПИВКА <br>
								для вашего преподавателю. <br>
								Срок действия акции - пока сертификаты Java есть в <br>
								наличии.
							</span>
                    </div>
                </div>
                <div class="col-md-1">
                    <div class="carousel_promotions_text">
                        <ul>
                            <li><a href="#"><span class="circle"></span></a></li>
                            <li><a href="#"><span class="circle"></span></a></li>
                            <li><a href="#"><span class="circle"></span></a></li>
                            <li><a href="#"><span class="circle active"></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="promotions_menu">
                        <ul>
                            <li><a href="#">Акции <span class="circle1"><i class="fa fa-play" aria-hidden="true"></i></span></a></li>
                            <li><a href="#">Доска объявлений <span class="circle1"><i class="fa fa-play" aria-hidden="true"></i></span></a></li>
                            <li><a href="#">Зоотакси <span class="circle1"><i class="fa fa-play" aria-hidden="true"></i></span></a></li>
                            <li><a href="#">Выгул собак <span class="circle1"><i class="fa fa-play" aria-hidden="true"></i></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<section class="promotions_blocks">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="pb_item">
                    <h3>Онлайн консультация</h3>
                    ведущих специалистов <br>в ВЦ Зоовет
                    <span class="pb_circle"></span><br>
                    <a href="#">Заказать <i class="fa fa-play" aria-hidden="true"></i></a>
                    <img class="ntbk_img" src="${pageContext.request.contextPath}/resources/img/netbook.gif" alt="" width="200px">
                </div>
            </div>
            <div class="col-md-4">
                <div class="pb_item">
                    <h3>Ветеренарная помощь<br> на дому</h3>
                    (495) 993-04-37<br>
                    круглосуточно
                    <span class="pb_circle"></span><br>
                    <a href="#">Подробнее <i class="fa fa-play" aria-hidden="true"></i></a>
                    <img class="dctr_img" src="${pageContext.request.contextPath}/resources/img/doctors.png" alt="" width="200px">
                </div>
            </div>
            <div class="col-md-4">
                <div class="pb_item">
                    <h3>Программа<br>мастер классов</h3>
                    с 7 сентября по 19 октября
                    <span class="pb_circle"></span><br>
                    <span class="sp_text">до 1 сентября</span>
                    <a href="#">Записаться <i class="fa fa-play" aria-hidden="true"></i></a>
                    <img class="dsc_img" src="${pageContext.request.contextPath}/resources/img/promotion.jpg" alt="" width="80px">
                </div>
            </div>
        </div>
    </div>
</section>
<section class="main_content">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="content">
                    <div class="top_line">
                        <h4>Международный научный центр лечения и реабилитации животных "Зоовет" - </h4>
                        это ведущий ветеринарный центр Казани и самый крупный лечебно-диагностический <br>
                        центр в России. Ветклиника "Зоовет" ориентирована на высококачественную <br>
                        круглосуточную ветеринарную помощь домашним животным.
                    </div>
                    <div class="services">
                        <h4>Мы готовы предоставить вам полный спектр услуг по лечению животных:</h4>
                        <div class="row">
                            <div class="col-md-4">
                                <ul class="left">
                                    <li>Эндохирургия</li>
                                    <li>Терпаия</li>
                                    <li>Хирургия</li>
                                    <li>Ветеринарная лаборатория</li>
                                    <li>Стационар</li>
                                    <li>Стоматолагия</li>
                                    <li>Офтальмология</li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <ul class="center">
                                    <li>Кардиология</li>
                                    <li>Анестезиология</li>
                                    <li>Реаниматология</li>
                                    <li>Оксигенотерапия</li>
                                    <li>Эндоскопия</li>
                                    <li>Бронхоскопия</li>
                                    <li>УЗИ диагностика</li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <ul class="right">
                                    <li>Рентгенография</li>
                                    <li>Электроэнцефалография</li>
                                    <li>Акушерство и гинекология</li>
                                    <li>Онкология</li>
                                    <li>Гомеопатия</li>
                                    <li>Диетология</li>
                                    <li>Чипирование</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="experts_wrap">
                        <h3>Наши специалисты</h3>
                        <div class="next_prev_experts">
                            <a href="#"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                        </div>
                        <div class="experts">
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="${pageContext.request.contextPath}/resources/img/doctor1.jpg" alt="" width="120px" height="120px" class="round_img">
                                    <a href="#">Роман Булгаков</a>
                                    <span>Ветеринарный <br>врач-терапевт</span>
                                </div>
                                <div class="col-md-4">
                                    <img src="${pageContext.request.contextPath}/resources/img/doctor2.jpg" alt="" width="120px" height="120px" class="round_img">
                                    <a href="#">Руслан Кузьмин</a>
                                    <span>Главный врач ветеринарного <br>центра "Зоовет"</span>
                                </div>
                                <div class="col-md-4">
                                    <img src="${pageContext.request.contextPath}/resources/img/doctor3.jpg" alt="" width="120px" height="120px" class="round_img">
                                    <a href="#">Виктория Тетерина</a>
                                    <span>Заместитель <br>главного врача</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="new_forum_wrap">
                    <h3>Новое на форуме</h3>
                    <div class="new_forum">
                        <div class="nf_item nf_item_first">
								<span class="date">
									04.08.15
								</span>
								<span class="topic_icon">
									<a href=""><img src="${pageContext.request.contextPath}/resources/img/topic_icon.png" alt="" width="25px"> 17</a>
									<br>
								</span>
								<span class="title_topic">
									котенку 1 месяц, кошка перестала кормить
								</span>
                        </div>
                        <div class="nf_item">
								<span class="date">
									07.08.15
								</span>
								<span class="topic_icon">
									<a href=""><img src="${pageContext.request.contextPath}/resources/img/topic_icon.png" alt="" width="25px"> 39</a>
									<br>
								</span>
								<span class="title_topic">
									SOS! не можем справиться с поносом у собаки
								</span>
                        </div>
                        <div class="nf_item">
								<span class="date">
									26.09.15
								</span>
								<span class="topic_icon">
									<a href=""><img src="${pageContext.request.contextPath}/resources/img/topic_icon.png" alt="" width="25px"> 14</a>
									<br>
								</span>
								<span class="title_topic">
									Котенок теряет силы
								</span>
                        </div>
                        <div class="nf_item">
								<span class="date">
									25.08.15
								</span>
								<span class="topic_icon">
									<a href=""><img src="${pageContext.request.contextPath}/resources/img/topic_icon.png" alt="" width="25px"> 8</a>
									<br>
								</span>
								<span class="title_topic">
									У кенара с двух сторон над глазами выпали перья
								</span>
                        </div>
                        <div class="nf_item">
								<span class="date">
									23.08.15
								</span>
								<span class="topic_icon">
									<a href=""><img src="${pageContext.request.contextPath}/resources/img/topic_icon.png" alt="" width="25px"> 44</a>
									<br>
								</span>
								<span class="title_topic">
									Кошка дёргается. Что это ?
								</span>
                        </div>
                        <div class="nf_item">
								<span class="date">
									27.08.15
								</span>
								<span class="topic_icon">
									<a href=""><img src="${pageContext.request.contextPath}/resources/img/topic_icon.png" alt="" width="25px"> 23</a>
									<br>
								</span>
								<span class="title_topic">
									Котята перестали ходить
								</span>
                        </div>
                    </div>
                    <a class="create_topic" href="#"><i class="fa fa-plus" aria-hidden="true"></i> Создать тему</a>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="bottom_content_wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="bottom_content">
                    <h4>Акции</h4>
                    <strong>Акция "Домашний доктор"</strong><br>
                    <div class="bc_text">
                        Инфузомат в аренду со скидкой. <br>
                        На 5 дней - скидка 3%, на 7 дней - скидка <br>
                        5%, на 10 дней - скидка 8%. <br>
                        Уважаемые клиенты!
                    </div>
                    <strong>Акция "Анестезиологический осмотр на<br>
                        дому перед операцией"</strong><br>
                    <div class="bc_text">
                        В домашних условиях мы можем <br>
                        выполнять операции у животных <br>
                        Уважаемые клиенты!
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="bottom_content">
                    <h4>Полезные статьи</h4>
                    <ul>
                        <li><a href="">Болезни собак и кошек, передающиеся<br>
                            человеку</a></li>
                        <li><a href="">Бешенство у животных</a></li>
                        <li><a href="">Биополе собак и кошек</a></li>
                        <li><a href="">Котята</a></li>
                        <li><a href="">Щенки. Уход и воспитание</a></li>
                        <li><a href="">Черепахи. Содержание и уход.</a></li>
                        <li><a href="">Грызуны</a></li>
                        <li><a href="">Лечение собак и кошек</a></li>
                        <li><a href="">Эвтаназия животных</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <div class="vote_wrap">
                    <h4>Голосование</h4>
                    <div class="vote">
                        <strong>Вы покупаете зоо товары <br>
                            в интернете с доставкой на дом ?</strong>
                        <div class="choices">
                            <input type="radio" name="vote_choice" value="yes"> Да, постоянно<br>
                            <input type="radio" name="vote_choice" value="no"> Иногда покупаю<br>
                            <input type="radio" name="vote_choice" value="never"> Никогда не покупаю<br>
                        </div>
                        <div class="vote_button">
                            <a href="#">Голосовать</a>
                        </div>
                    </div>
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