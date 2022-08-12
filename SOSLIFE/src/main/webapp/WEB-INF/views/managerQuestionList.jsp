<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// scope(pageContext, request, session, applicaton)
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
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/notice.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${cpath}/resources/js/question_info.js"></script>
</head>

<body>
	<script type="text/javascript">
    	$(document).ready(function(){
	    	GetQuestionList()
	    });
    </script>
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
                    <a href="managerMain.do">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">홈</span>
                    </a>
                </li>
                   <li>
                    <a href="managerNoticeList.do">
                        <span class="icon">
                           <ion-icon name="notifications-outline"></ion-icon>
                        </span>
                        <span class="title">공지사항</span>
                    </a>
                </li>
                <li>
                    <a href="managerQuestionList.do">
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
                        <span class="title">Sign Out</span>
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
                <!-- search-->
                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>
                <!--userImg-->
                <div class="user">
                    <img src="${cpath}/resources/imgList/mainImg/user.PNG">
                </div>
            </div>
            <!--notice 시작-->
            <div class="board_wrap">
                <div class="board_title">
                    <strong>문의사항</strong>
                </div>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="num">번호</div>
                            <div class="title">문의내용</div>
                            <div class="count">문의종류</div>
                            <div class="writer">글쓴이</div>
                            <div class="date">작성일</div>
                        </div>
                        <div id='question_div'>
                      
                        </div>
                    </div>
                    <div class="board_page">
                        <a href="#" class="bt first"><<</a>
                        <a href="#" class="bt prev"><</a>
                        <a href="#" class="num on">1</a>
                        <a href="#" class="num">2</a>
                        <a href="#" class="num">3</a>
                        <a href="#" class="num">4</a>
                        <a href="#" class="num">5</a>
                        <a href="#" class="bt next">></a>
                        <a href="#" class="bt last">>></a>
                    </div>
                </div>
            </div>