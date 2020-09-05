<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery-3.4.1.min.js"></script>


<div class="box" id="main_image">
    <img id="logo" />
</div>
<div class="box" id="main_auth">
    <jsp:include page="login/loginForm.jsp" />
</div>
