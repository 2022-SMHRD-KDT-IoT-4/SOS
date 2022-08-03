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
            </div>
        <form action="regist_jacket.do">
            <div class="registerBox">
                <p>제품등록</p> 
                <div class="registerNum">
                  <input type="text" name='product_id'><button type="submit" id="sub">등록</button> 
                </div> 
                
              </div>
              <div class="plus">+추가하기</div>
              <div class="allSub">전체등록</div>
        </div>
		</form>

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
            //제품등록 스크립트
            $(document).ready(function (){
                $(".plus").click(function(){
                    var  registerBtn = $("<input type='text'>");
                    var  removeBtn   = $("<button type='submit'/>").text("X");
                    var  registerSub = $("<button type='submit'/>").text("등록");
                    var  registerNum = $("<div/>").append(registerBtn).addClass("registerNum").append(registerSub).append(removeBtn);

                    $(".registerBox").append(registerNum);

                    removeBtn.click(function(e){
                    registerNum.remove();
                    });

                    //신규 추가한 시리얼(2행부터)
                    registerSub.click(function(e){
                        var submit = $(registerBtn).val();
                        console.log(submit);
                    });
                });

                $("#sub").click(function(e){
                    var submit1 = $(e.target).prev().val();
                });
                
                //기존 시리얼(1행만)
                $(".allSub").click(function(){
                    var allSubmit = $(".registerNum").find("input");

                   // allSubmit.
                   for( var i = 0; i < allSubmit.length; i++)
                   {
                        var serial = $(allSubmit[i]).val();

                        //serial
                   }
                   
                });
            });  
            
                
        </script>
</body>

</html>