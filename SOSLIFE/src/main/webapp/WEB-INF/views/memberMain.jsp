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
    <script src="${cpath}/resources/js/jacket_info.js"></script>
    <script src="https://code.highcharts.com/stock/highstock.js"></script>
	<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/stock/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
    
</head>

<body>
   <%
      tbl_user user = (tbl_user)session.getAttribute("user");
   %>
   <script type="text/javascript">
      $(document).ready(function(){
    	loadJacketList('${user.getUser_id()}');
    	LoadNoticeList();
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
                  <!--  --><div class="box">
                    <iframe src="http://172.30.1.40:5000/" title="내용" width="100%" height="500px"></iframe>
                  </div>
                  <div class="box" id="container">
                    
                    
                  </div>
              </div>
                    
                    <div class="details">
                        <!--고객 명단list-->
                        <div class="recentOrders">
                            <div class="cardHeader">
                                <h2>
                                    <%=user.getUser_nick() %>님 환영합니다
                                </h2>
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
                                <tbody id='istbody'>
                                  
                                </tbody>
                            </table>
                        </div>
                        <!--new customer-->
                        <div class="recentCustomers">
                            <div class="cardHeader">
                                <h2>공지 사항</h2>
                                <a href="memberNoticeList.do" class="btn">View All</a>
                            </div>
                                <table>
                                	<tbody id='noticetbody'>
                                    
                                    </tbody>
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
        <script src="${cpath}/resources/js/chart.js"></script>
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
            
                
                
                
        </script>
        
</body>

</html>