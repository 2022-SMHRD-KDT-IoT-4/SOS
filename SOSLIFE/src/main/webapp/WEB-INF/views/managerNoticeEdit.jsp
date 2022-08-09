<%@page import="com.sos.domain.tbl_notice"%>
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
</head>

<body>
	<%
		tbl_notice notice = (tbl_notice)request.getAttribute("noticeedit");
	%>
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
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                        <span class="title">Customers</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">Message</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="help-outline"></ion-icon>
                        </span>
                        <span class="title">Help</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="settings-outline"></ion-icon>
                        </span>
                        <span class="title">Settings</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                        </span>
                        <span class="title">Password</span>
                    </a>
                </li>
                <li>
                    <a href="#">
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
                    <img src="/imgList/mainImg/user.PNG">
                </div>
            </div>
            <!--notice 시작-->
            <form action="manageNoticeUpdate.do" method="post" enctype="multipart/form-data">
            <div class="board_wrap">
                <div class="board_title">
                    <strong>공지사항</strong>
                    <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
                </div>
                <div class="board_write_wrap">
                    <div class="board_write">
                        <div class="title">
                            <dl>
                                <dt>제목</dt>
                                <dd><input type="text" placeholder="제목 입력" name="notice_subject" value="<%=notice.getNotice_subject() %>"></dd>
                            </dl>
                        </div>
                        <div class="info">
                            <dl>
                                <dt>글쓴이</dt>
                                <dd><input type="text" placeholder="글쓴이 입력" value="<%=notice.getNotice_id()%>"></dd>
                            </dl>
                                <input type="hidden" name="notice_seq" value="${noticeedit.getNotice_seq() }">
                        <div><input type="file" name="notice_file"></div>
                        </div>
                        <div class="cont">
                           
                            <textarea placeholder="내용 입력" name="notice_content">
       <%=notice.getNotice_content() %></textarea>
                        </div>
                    </div>
                    <div class="bt_wrap">
                        <input type='submit' class="on" value="수정">
                        <input type='reset' value="취소">
                    </div>
                </div>
            </div>
        </form>














        </div>
    </div>


    <!--아이오닉콘즈 다운로드 절대 /body 앞에 둬야 설치가 되니 이동 X-->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
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
    </script>
</body>

</html>