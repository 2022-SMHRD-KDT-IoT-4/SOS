<%@page import="com.sos.domain.tbl_user"%>
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
    <link href="${cpath}/resources//imgList/lifeJacket.png" rel="shortcut icon" type="image/x-icon">
    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Mouse+Memoirs&display=swap" rel="stylesheet">
<!--font end-->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/memberMain.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body>
	<%
		tbl_user user = (tbl_user)session.getAttribute("user");
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
                    <a href="memberMain.do">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">전체보기</span>
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
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">메신저</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="help-outline"></ion-icon>
                        </span>
                        <span class="title">게시판</span>
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
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                        </span>
                        <span class="title">비밀번호 변경</span>
                    </a>
                </li>
                <li>
                    <a href="#">
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
            <!-- cards-->
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">17 일차</div>
                        <div class="cardName">안전 운항</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="boat-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">On</div>
                        <div class="cardName">WI-Fi</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="wifi-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">Q&A</div>
                        <div class="cardName">문의사항</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">AS</div>
                        <div class="cardName">신청하기</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="hammer-outline"></ion-icon>
                    </div>
                </div>
              </div>      

              <!--Add Chart-->
              <div class="graphBox">
                  <div class="box">
                    <iframe src="http://192.168.243.26:8009/" title="내용" width="100%" height="500px"></iframe>
                  </div>
                  <div class="box">
                    <canvas id="myChart"></canvas>
                  </div>
              </div>

                    
                    <div class="details">
                        <!--고객 명단list-->
                        <div class="recentOrders">
                            <div class="cardHeader">
                                <h2>
                                    <%=user.getUser_nick() %> 님 환영합니다
                                </h2>
                                <span>제품번호 : 12312412412312312</span>
                                <a href="#" class="btn">View All</a>
                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <td>구명조끼</td>
                                        <td>배터리</td>
                                        <td>현재상태</td>
                                        <td>통신상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="reDataA">
                                        <td>A</td>
                                        <td><span><ion-icon name="battery-full-outline" style="color:green" width="50px"></ion-icon></span>
                                            80%</td>
                                        <td>온도:24 수압:0 물감지:0</td>
                                        <td><span class="status disconnect">불량</span></td>
                                    </tr>
                                    <tr>
                                        <td id="reDataB">B</td>
                                        <td><span><ion-icon name="battery-half-outline" style="color:orange"></ion-icon></span>
                                            50%</td>
                                        <td>온도:22 수압:0 물감지:0</td>
                                        <td><span class="status connect">정상</span></td>
                                    </tr>
                                    <tr>
                                        <td>C</td>
                                        <td><span><ion-icon name="battery-dead-outline" style="color:red"></ion-icon></span>
                                            10%</td>
                                        <td>온도:24 수압:0 물감지:0</td>
                                        <td><span class="status warning">불안</span></td>
                                    </tr>
                                    <tr>
                                        <td>D</td>
                                        <td><span><ion-icon name="battery-half-outline" style="color:orange"></ion-icon></span>
                                            49%</td>
                                        <td>온도:23 수압:0 물감지:0</td>
                                        <td><span class="status good">양호</span></td>
                                    </tr>
                                    <tr>
                                        <td>E</td>
                                        <td><span><ion-icon name="battery-full-outline" style="color:green"></ion-icon></span>
                                            97%</td>
                                        <td>온도:23 수압:0 물감지:0</td>
                                        <td><span class="status good">양호</span></td>
                                    </tr>
                                    <tr>
                                        <td>F</td>
                                        <td><span><ion-icon name="battery-full-outline" style="color:green"></ion-icon></span>
                                            91%</td>
                                        <td>온도:23 수압:0 물감지:0</td>
                                        <td><span class="status connect">정상</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--new customer-->
                        <div class="recentCustomers">
                            <div class="cardHeader">
                                <h2>공지 사항</h2>
                            </div>
                                <table>
                                    <tr>
                                        <td width="60px">2022.08.02</td>
                                        <td><h4>관리자<br><span>통신 업데이트 하였습니다.</span></h4></td>
                                    </tr>
                                    <tr>
                                        <td width="60px">2022.07.29</td>
                                        <td><h4>관리자<br><span>모듈 업데이트 하였습니다.</span></h4></td>
                                    </tr>
                                    <tr>
                                        <td width="60px">2022.07.16</td>
                                        <td><h4>관리자<br><span>AS일정이 늦어짐을 공지합니다.</span></h4></td>
                                    </tr>
                                    <tr>
                                        <td width="60px">2022.07.16</td>
                                        <td><h4>관리자<br><span>신규 제품을 소개합니다 !</span></h4></td>
                                    </tr>
                                    <tr>
                                        <td width="60px">2022.07.14</td>
                                        <td><h4>관리자<br><span>07.15 서버점검 1시간 서버점검이 있습니다.</span></h4></td>
                                    </tr>
                                </table>
                        </div>
                        
                    </div>

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