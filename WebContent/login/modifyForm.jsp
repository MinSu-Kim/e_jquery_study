<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<script src="js/modify.js"></script>

 ${emp}
 
<c:catch var="e">
<div id="regForm" class="box">
    <fieldset>
        <legend>회원 정보수정</legend>
        <ul>
            <li>
                <label for="email">아이디</label> 
                <input id="email" type="email" name="email" value="${emp.email }">
            </li>
            <li>
                <label for="passwd">비밀번호</label> 
                <input id="passwd" type="password" name="passwd" placeholder="6~16자 숫자/문자 ">
            </li>
            <li>
                <label for="name">이름</label> 
                <input id="name" type="text" name="name" value="${emp.empName }">
            </li>
            <li>
                <label for="tel">전화번호</label> 
                <input id="tel" type="tel" name="tel" value="${emp.tel }">
            </li>
            <li>
                <label for="empNo">사원번호</label> 
                <input id="empNo" type="number" name="empNo" value="${emp.empName}">
            </li>
            <li>
                <label for="title">직책</label> 
                <select id="title">
                
                    <option value="1" <c:if test="${emp.title eq 1}">selected</c:if> >사장</option>
                    <option value="2" <c:if test="${emp.title eq 2}">selected</c:if> >부장</option>
                    <option value="3" <c:if test="${emp.title eq 3}">selected</c:if> >과장</option>
                    <option value="4" <c:if test="${emp.title eq 4}">selected</c:if> >대리</option>
                    <option value="5" <c:if test="${emp.title eq 5}">selected</c:if> >사원</option>
                </select>
            </li>
            <li>
                <label for="dept">부서</label> 
                <select id="dept">
                    <option value="1" <>영업</option>
                    <option value="2">기획</option>
                    <option value="3">개발</option>
                    <option value="4">총무</option>
                </select>
            </li>
            <li>
                <label for="manager">직속상사</label> 
                <select id="manager">
                    <option value="4377">이성래</option>
                    <option value="3011">이수민</option>
                    <option value="1003">조민희</option>
                    <option value="3426">박영권</option>
                </select>
            </li>
            <li>
                <label for="salary">급여</label> 
                <input id="salary" type="number" name="salary" value="${emp.salary }">
            </li>
            <li>
                <button id="modifyProcess">수정</button>
                <button id="calcel">취소</button>
            </li>
        </ul>
    </fieldset>
</div>
</c:catch>

<c:if test="${e != null }">
    익셉션이 발생하였습니다:<br> ${e}
</c:if>

