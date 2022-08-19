<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("cpath", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[SOS] Serving Our Savior</title>
    <link href="${cpath}/resources/imgList/lifeJacket.png" rel="shortcut icon" type="image/x-icon">
    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Mouse+Memoirs&display=swap" rel="stylesheet">
	<!--font end-->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/memberMain.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="bulb-outline"></ion-icon>
                        </span>
                        <span class="title">Safe Our Savior Manager</span><br>
                        
                    </a>
                </li>
                <li>
                    <a href="memberMain.do">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">전체보기</span>
                    </a>
                </li>
                <li>
                    <a href="memberNoticeList.do">
                        <span class="icon">
                            <ion-icon name="help-outline"></ion-icon>
                        </span>
                        <span class="title">공지사항</span>
                    </a>
                </li>
                <li>
                    <a href="registjacket.do">
                        <span class="icon">
                            <ion-icon name="ribbon-outline"></ion-icon>
                        </span>
                        <span class="title">제품등록</span>
                    </a>
                </li>
                <li>
                    <a href="Question.do">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">문의사항</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="settings-outline"></ion-icon>
                        </span>
                        <span class="title">설정</span>
                    </a>
                </li>
                <li>
                    <a href="logout.do">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">로그아웃</span>
                    </a>
                </li>
            </ul>
        </div>

        <!--main-->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>
            </div>
            <div class="request_register">
                <form action="question_insert.do">
                	<div class="selectStyle">
                    <div class="row">
                        <div class="input-group">
                            <input type="text" id="name" name="q_name" required>
                        <label for="name"><ion-icon name="person-outline"></ion-icon>이름</label>
                        </div>
                        <div class="input-group">
                            <input type="text" id="number" name="q_phone" required>
                        <label for="number"><ion-icon name="call-outline"></ion-icon>전화번호</label>
                        </div>
                    </div>
                    
                    <div class="input-group">
                        <input type="text" id="email" name="q_email" required>
                    <label for="email"><ion-icon name="mail-outline"></ion-icon>이메일</label>
                    </div>
                    <div class="input-group">
                    <div class="select">
                    <select name="q_type" id="format">
                        <option value="communication">통신불량</option>
                        <option value="batery">배터리교체</option>
                        <option value="etc">기타</option>
                    </select>
                    </div>
                    </div>
                    <div class="input-group">
                        <textarea id="" rows="8" name="q_content" required></textarea>
                    <label for="message"><ion-icon name="chatbubbles-outline"></ion-icon>내용</label>
                    </div>
                    <button type="submit">문의하기<ion-icon name="paper-plane-outline"></ion-icon></button>
                </form>
              
        </div>
</div>

        <!--아이오닉콘즈 다운로드 절대 /body 앞에 둬야 설치가 되니 이동 X-->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <!--chart.js-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.2/dist/chart.min.js"></script>
        <script src="${cpath}/resources/js/my_chart.js"></script>
        <!--end-->
        <script>
            //MenuToggle
            let toggle = document.querySelector('.toggle');
            let navigation = document.querySelector('.navigation');
            let main = document.querySelector('.main');

            toggle.onclick = function () {
                navigation.classList.toggle('active');
                main.classList.toggle('active');
            }

            //add hovered class in selected list item
            let list = document.querySelectorAll('.navigation li');
            function activeLink() {
                list.forEach((item) =>
                    item.classList.remove('hovered'));
                this.classList.add('hovered');
            }
            list.forEach((item) =>
                item.addEventListener('mouseover', activeLink))
            
                
                //$(document).ready(function (){
                  // $(function belt_chart(){

                   //}) 
                //});
            
            
                
        </script>
</body>

</html>