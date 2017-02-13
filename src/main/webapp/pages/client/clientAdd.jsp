<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add client</title>
    <link rel="stylesheet" type="text/css" href="../css/baseStyle.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.1.js"></script>

    <script type="text/javascript">
        function createClient(){
            if(validate()){
                $('#addName').css('background-color', '');
                $('#addSurname').css('background-color', '');
                $('#number').css('background-color', '');
            }else{
                alert("Поля обязательны для заполнения");
                return false;
            }
        }

        function validate(){
            var result = true;
            if($('#addName').val() == ''){
                $('#addName').css('background-color', 'pink');
                result = false;
            }
            if($('#addSurname').val() == ''){
                $('#addSurname').css('background-color', 'pink');
                result = false;
            }
            if($('#number').val() == ''){
                $('#number').css('background-color', 'pink');
                result = false;
            }
            return result;
        }
    </script>
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
            <form action="${pageContext.servletContext.contextPath}/client/add" method='POST'> <!-- форма кнопки Добавить -->
                <p>Name of client:
                    <input type='text' name='name'/></p>
                <p>Surname of client:
                    <input type='text' name='surname'/></p>
                <p>Email of client:
                    <input type='text' name='email'/></p>
                <p>Sex:
                <input type='radio' name='sex' value='Man' checked/>Man
                    <input type='radio' name='sex' value='Women'/>Women</p>
                <p>Number phone of client:
                    <input type='text' name='phoneNumber'/></p>
                <p>City:
                    <select name="city">
                        <option value='Kiev'>Kiev</option>
                        <option value='Kharkov'>Kharkov</option>
                        <option value='Odessa'>Odessa</option>
                        <option value='Lviv'>Lviv</option>
                        <option value='Dnepropetrovsk'>Dnepropetrovsk</option>
                    </select></p>
                <input type='submit' value="Добавить"/>
            </form>
        </div>
    </div>
</body>
</html>
