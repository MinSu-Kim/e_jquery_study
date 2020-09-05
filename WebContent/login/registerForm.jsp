<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="js/register.js"></script>


<div id="regForm" class="box">
<fieldset>
    <legend>회원 가입</legend>
    <ul>
        <li>
            <label for="email">아이디</label> 
            <input id="email" type="email" name="email" placeholder="example@kings.com">
            <button id="checkId">ID중복확인</button>
        </li>
        <li>
            <label for="passwd">비밀번호</label> 
            <input id="passwd" type="password" name="passwd" placeholder="6~16자 숫자/문자 ">
        </li>
        <li>
            <label for="repass">비밀번호 확인</label> 
            <input id="repass" type="password" name="repass" placeholder="6~16자 숫자/문자 ">
        </li>
        <li>
            <label for="name">이름</label> 
            <input id="name" type="text" name="name" placeholder="홍길동">
        </li>
        <li>
            <label for="tel">전화번호</label> 
            <input id="tel" type="tel" name="tel" placeholder="전화번호 입력">
        </li>
        <li>
            <label for="empNo">사원번호</label> 
            <input id="empNo" type="number" name="empNo" placeholder="사원번호 입력">
        </li>
        <li>
            <label for="title">직책</label> 
            <select id="title">
                <option value="1">사장</option>
                <option value="2">부장</option>
                <option value="3">과장</option>
                <option value="4">대리</option>
                <option value="5">사원</option>
            </select>
        </li>
        <li>
            <label for="dept">부서</label> 
            <select id="dept">
                <option value="1">영업</option>
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
            <input id="salary" type="number" name="salary" placeholder="급여 입력">
        </li>
        <li>
            <button id="process">가입하기</button>
            <button id="calcel">취소</button>
        </li>
    </ul>
</fieldset>
</div>