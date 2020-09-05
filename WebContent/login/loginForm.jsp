<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="js/login.js"></script>

<c:catch var="e">
<div id="status">
    <c:choose>
        <c:when test="${empty email}">
            <fieldset>
                <legend>로그인</legend>
                <ul>
                    <li>
                        <label for="email">아이디</label> 
                        <input id="email" type="email" name="email" placeholder="example@kings.com">
                    </li>
                    <li>
                        <label for="passwd">비밀번호</label> 
                        <input id="passwd" type="text" name="passwd" placeholder="6~16자 숫자/문자 ">
                    </li>
                    <li>
                        <button id="login">로그인</button>
                        <button id="register">회원가입</button>
                    </li>
                </ul>
            </fieldset>
        </c:when>
        
        <c:otherwise>
            <fieldset>
                <legend>로그인</legend>
                <ul>
                    <li>
                        <b>${email }</b>님이 로그인 하셨습니다.
                    </li>
                    <li >
                        <button id="logout">로그아웃</button>
                        <button id="update">회원 정보 변경</button>
                    <li>
                </ul>
            </fieldset>
        </c:otherwise>
    </c:choose>
</div>
</c:catch>

<c:if test="${e != null }">
    익셉션이 발생하였습니다:<br> ${e}
</c:if>