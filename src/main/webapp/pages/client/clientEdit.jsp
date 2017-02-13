<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Client edit</title>
    <link rel="stylesheet" type="text/css" href="../css/baseStyle.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.1.js"></script>
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
            <form action="${pageContext.servletContext.contextPath}/client/edit" method='POST'> <!-- форма кнопки Edit -->
                <input type='hidden' name='id' value="${client.id}"/>
                <input type='hidden' name='sex' value="${client.sex}"/>
                <p>Fullname: ${client.name} ${client.surname}</p>
                <p>Name:
                <input type='text' name='name' value="${client.name}"/></p>
                <p>Surname:
                    <input type='text' name='surname' value="${client.surname}"/></p>
                <p>Email:
                    <input type='text' name='email' value="${client.email}"/></p>
                <p>ID of client:
                ${client.id}</p>
                <p>Sex: ${client.sex}</p>
                <p>Phone number:
                    <input type='text' name='phoneNumber' value="${client.phoneNumber}"/></p>
                <p>City: </label>
                    <input type='text' name='city' value="${client.city}"/>
                </p>
                <input type='submit' value="Edit"/>
            </form>
            <form action="${pageContext.servletContext.contextPath}/client/delete" method='POST'> <!-- форма кнопки Delete -->
                    <input type='hidden' name='id' value="${client.id}"/>
                    <input type='submit' value="Delete"/>
            </form>
            </table>
            <br>
            <br>
            <h3>Add a new pet of client</h3>
                <form action="${pageContext.servletContext.contextPath}/client/addPet" method='POST'> <!-- форма кнопки Add pet -->
                    <p><input type='hidden' name='idClient' value="${client.id}"/>
                    Type pet:
                    <select name="type" id="typeSelect">
                        <option value='Other'>Other</option>
                        <option value='Cat'>Cat</option>
                        <option value='Dog'>Dog</option>
                        <option value='Fish'>Fish</option>
                        <option value='Bird'>Bird</option>
                        <option value='Reptile'>Reptile</option>
                        <option value='Rodent'>Rodent</option>
                    </select></p>
                    </p>
                    Nickname of pet:
                    <input type='text' name='name'/></p>
                    Age of pet:
                    <select name="age">
                        <c:forEach begin="1" end="30" varStatus="loop">
                            <option value='${loop.index}'>${loop.index} years</option>
                        </c:forEach>
                    </select></p>
                    Weight of pet:
                    <select name="weight">
                        <c:forEach begin="1" end="150" varStatus="loop">
                            <option value='${loop.index}'>${loop.index} kg</option>
                        </c:forEach>
                    </select></p>
                    <input type="submit" value="Add pet"/>
                </form>

            <br>

            <c:if test="${not empty pets}">
            <table> <!-- Таблица всех питомцев данного клиента -->
                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Nickname of pet</th>
                    <th>Age of pet</th>
                    <th>Weight of pet</th>
                    <th>Actions</th>
                </tr>
                <c:forEach items="${pets}" var="pet" varStatus="status">
                    <tr>
                        <td>${pet.id}</td>
                        <td>${pet.type}</td>
                        <td>${pet.name}</td>
                        <td>${pet.age}</td>
                        <td>${pet.weight}</td>
                        <td>
                            <form action="${pageContext.servletContext.contextPath}/client/deletePet" method='POST'>
                                <input type='hidden' name='idPet' value="${pet.id}"/>
                                <input type = "submit" value = "delete pet" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            </c:if>
        </div>
    </div>
</body>
</html>
