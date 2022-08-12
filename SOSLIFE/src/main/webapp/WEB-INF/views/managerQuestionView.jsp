<%@page import="com.sos.domain.tbl_question"%>
<%@page import="com.mysql.cj.protocol.x.Notice"%>
<%@page import="com.sos.domain.tbl_notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="${cpath}/resources/imgList/lifeJacket.png"
	rel="shortcut icon" type="image/x-icon">
<!--font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Mouse+Memoirs&display=swap"
	rel="stylesheet">
<!--font end-->
<link rel="stylesheet" type="text/css"
	href="${cpath}/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="${cpath}/resources/js/question_info.js"></script>
<%
	tbl_question question = (tbl_question) request.getAttribute("questioneone");
%>
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
					<label> <input type="text" placeholder="Search here">
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
				<div class="board_view_wrap">
					<div class="board_view" id='question_one'>
					<script type="text/javascript">
						console.log('${questionone}')
					</script>
						<div class="title">${questionone.getQ_type()}</div>
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>${questionone.getQ_seq()}</dd>
							</dl>
							<dl>
								<dt>글쓴이</dt>
								<dd>${questionone.getUser_id()}</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>${questionone.getQ_date()}</dd>
							</dl>
							<dl>
								<dt>이메일</dt>
								<dd>${questionone.getQ_email()}</dd>
							</dl>
						</div>
						<div class="cont">
							${questionone.getQ_content()}
						</div>
					</div>
					<div class="bt_wrap">
						<a href="managerQuestionList.do" class="on">목록</a>
					</div>
				</div>
			</div>













		</div>
	</div>


	<!--아이오닉콘즈 다운로드 절대 /body 앞에 둬야 설치가 되니 이동 X-->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
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