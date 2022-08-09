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
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Dashboard</span>
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
                                <a href="#" class="btn">View All</a>
                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <td>고객명</td>
                                        <td>등록일자</td>
                                        <td>제품번호</td>
                                        <td>통신상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>박종현 님</td>
                                        <td>22.08.01</td>
                                        <td>1509-f1s1-d1w1-r2zs</td>
                                        <td><span class="status disconnect">불량</span></td>
                                    </tr>
                                    <tr>
                                        <td>김철민 님</td>
                                        <td>22.07.30</td>
                                        <td>1417-f1r1ts-rt1q-qszz</td>
                                        <td><span class="status connect">정상</span></td>
                                    </tr>
                                    <tr>
                                        <td>서찬종 님</td>
                                        <td>22.07.15</td>
                                        <td>1080-bt1r-1q1zs-1r8t</td>
                                        <td><span class="status warning">불안</span></td>
                                    </tr>
                                    <tr>
                                        <td>박원 님</td>
                                        <td>22.08.05</td>
                                        <td>1234-d1rt-1r1q-542z</td>
                                        <td><span class="status good">양호</span></td>
                                    </tr>
                                    <tr>
                                        <td>Refrigerator</td>
                                        <td>$1200</td>
                                        <td>paid</td>
                                        <td><span class="status delivered">delivered</span></td>
                                    </tr>
                                    <tr>
                                        <td>Refrigerator</td>
                                        <td>$1200</td>
                                        <td>paid</td>
                                        <td><span class="status delivered">delivered</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--new customer-->
                        <div class="recentCustomers">
                            <div class="cardHeader">
                                <h2>문의 사항</h2>
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