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
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/managerMain.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${cpath}/resources/js/jacket_info.js"></script>
</head>

<body>
	<script type="text/javascript">
      $(document).ready(function(){
    	  LoadJacketInfo()
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
                
            </div>
            <!-- cards-->
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">1,504</div>
                        <div class="cardName">총 회원 수</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="boat-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">32</div>
                        <div class="cardName">현재 사용자</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="eye-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">5</div>
                        <div class="cardName">문의사항</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">AS</div>
                        <div class="cardName">일정</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="hammer-outline"></ion-icon>
                    </div>
                </div>
              </div>      
                    
                    <div class="details">
                        <!--고객 명단list-->
                        <div class="recentOrders">
                            <div class="cardHeader">
                                <h2>
                                    현재 사용자
                                </h2>
                               
                            </div>
                            <table>
                                <thead id="istthead">
                                   
                                </thead>
                                <tbody id="isttbody">
                                   
                                </tbody>
                            </table>
                        </div>
                        <!--new customer-->
                        <div class="recentCustomers">
                            <div class="cardHeader">
                                <h2>문의 사항</h2>
                                 <a href="#" class="btn">View All</a>
                            </div>
                                <table>
                                    <tr>
                                        <td width="60px"><div class="imgBx"><img src="${cpath}/resources/imgList/mainImg/heart.png" width="50px" height="50px"></div></td>
                                        <td><h4>덕배<br><span>통신불량문의</span></h4></td>
                                    </tr>
                                    <tr>
                                        <td width="60px"><div class="imgBx"><img src="${cpath}/resources/imgList/mainImg/heart.png" width="50px" height="50px"></div></td>
                                        <td><h4>철수<br><span>구명조끼AS문의</span></h4></td>
                                    </tr>
                                    <tr>
                                        <td width="60px"><div class="imgBx"><img src="${cpath}/resources/imgList/mainImg/heart.png" width="50px" height="50px"></div></td>
                                        <td><h4>순이<br><span>배터리교체문의</span></h4></td>
                                    </tr>
                                    <tr>
                                        <td width="60px"><div class="imgBx"><img src="${cpath}/resources/imgList/mainImg/heart.png" width="50px" height="50px"></div></td>
                                        <td><h4>맹구<br><span>배터리교체문의</span></h4></td>
                                    </tr>
                                    <tr>
                                        <td width="60px"><div class="imgBx"><img src="${cpath}/resources/imgList/mainImg/heart.png" width="50px" height="50px"></div></td>
                                        <td><h4>영구<br><span>배터리교체문의</span></h4></td>
                                    </tr>
                                </table>
                        </div>
                        
                    </div>

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