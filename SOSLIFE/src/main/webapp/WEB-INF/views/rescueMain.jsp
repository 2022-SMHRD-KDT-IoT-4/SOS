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
    <link href="/imgList/lifeJacket.png" rel="shortcut icon" type="image/x-icon">
    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Mouse+Memoirs&display=swap" rel="stylesheet">
    <!--font end-->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/rescueTeam.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

</head>
	<script type="text/javascript">
		$(document).ready(function(){
			loadWeather()
		});
	</script>
<body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="bulb-outline"></ion-icon>
                        </span>
                        <span class="title">Safe Our Savior RescueTeam</span><br>

                    </a>
                </li>
                <li>
                    <a href="rescueMain.do">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">전체보기</span>
                    </a>
                </li>
                <li>
                    <a href="managerNoticeList.do">
                        <span class="icon">
                            <ion-icon name="help-outline"></ion-icon>
                        </span>
                        <span class="title">공지사항</span>
                    </a>
                </li>
                <li>
                    <a href="rescuequesiton.do">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">문의하기</span>
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
                        <strong>1강의실 구조대</strong>
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
                        <div class="numbers">SOS 요청</div>
                        <div class="cardName">*발생시 색깔이 변합니다*</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="volume-high-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><span class="cicon"></span><span id="ctemp">현재
                                온도:</span>&nbsp;&nbsp;<span id="clowtemp">최저 온도: </span>&nbsp;&nbsp;
                                <span id="chightemp">최고 온도: </span></div>
                        <div class="swiper-slide"><span class="cicon"></span><span id="windspeed">풍속(m/s): </span>&nbsp;&nbsp;<span id="sealevel">해수면(대기압): </span>&nbsp;&nbsp;<span id="humidity">습도: </span></div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            	 </div>
            </div>
			<!-- 날씨 -->
			
			
			
            <!--Add Chart-->
            <div class="graphBox">
                

                <div id="map" style="width:100%;height:70vh;" class="box"></div>

            </div>


            

        </div>
    </div>

	<!--swiper-->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
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

        list.forEach((item) =>
            item.addEventListener('click', activeLink))

                //$(document).ready(function (){
                  // $(function belt_chart(){

                   //})
                //});

    </script>
    <!--지도 api 시작-->
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3567b89d0953a2a365730261cf615f03&libraries=clusterer"></script>
    <script>
        //1.지도 좌표
        let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(34.968196, 126.386520), // 지도의 중심좌표
                level: 3, // 지도의 확대 레벨
                mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
            };



        // 지도를 생성한다 
        let map = new kakao.maps.Map(mapContainer, mapOption);
        // 마커 클러스터러를 생성합니다 
        let clusterer = new kakao.maps.MarkerClusterer({
            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
            minLevel: 4 // 클러스터 할 최소 지도 레벨 
        });

        let imageSrc = "${cpath}/resources/imgList/mainImg/boatMarker.png", // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
            imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
        //오버레이
        //let overlay = null

        let i = 0;
        let mapData = [
            [34.968086, 126.385394, '<div style="padding: 5px">내용</div>',
                '<div class="wrap" id="data0">' +
                '    <div class="info">' +
                '        <div class="mapTitle">' +
                '            고잉메리호' +
                '            <div class="close" onclick="closeOverlay(0)" title="닫기"></div>' +
                '        </div>' +
                '        <div class="mapbigBox">' +
                '            <div class="mapbox">' +
                '                <iframe src="https://wikidocs.net/" title="내용" width="450px" height="300px">'+
                '    </iframe>'+ 
                '           </div>' +
                '            <div class="user_mapBox">' +
                '                <div class="user_mapBox_nickname">박종현 님</div>' +
                '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
                '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>'],
            [34.967387, 126.386286, '<div style="padding: 5px">내용2</div>',
                '<div class="wrap" id="data1">' +
                '    <div class="info">' +
                '        <div class="title">' +
                '            카카오 스페이스닷원' +
                '            <div class="close" onclick="closeOverlay(1)" title="닫기"></div>' +
                '        </div>' +
                '        <div class="body">' +
                '            <div class="img">' +
                '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                '           </div>' +
                '            <div class="desc">' +
                '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' +
                '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
                '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>'],
            [34.967589, 126.384076, '<div style="padding: 5px">내용3</div>',
                '<div class="wrap" id="data2">' +
                '    <div class="info">' +
                '        <div class="title">' +
                '            카카오 스페이스닷원' +
                '            <div class="close" onclick="closeOverlay(2)" title="닫기"></div>' +
                '        </div>' +
                '        <div class="body">' +
                '            <div class="img">' +
                '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                '           </div>' +
                '            <div class="desc">' +
                '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' +
                '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
                '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>'],
        ]
        let markers = []; //클러스터에 마커담기
        let overlays = [];
        for (i = 0; i < mapData.length; i++) {

            //지도에 마커를 생성하고 표시한다
            let marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(mapData[i][0], mapData[i][1]), //마커의 좌표
                map: map, //마커를 표시할 지도 선택
                image: markerImage // 마커이미지 설정 
            });
            // 마커 위에 커스텀오버레이를 표시합니다
            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다


            //var iwContent = '<div style="padding: 5px">내용</div>'
            //iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다


            // 인포윈도우를 생성합니다
            let infowindow = new kakao.maps.InfoWindow({
                content: mapData[i][2]
            });
            
            let overlay = new kakao.maps.CustomOverlay({
                content: mapData[i][3],
                position: marker.getPosition()
            });

            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            //infowindow.open(map, marker);
            markers.push(marker); //클러스터
            overlays.push(overlay);
            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
            //오버레이 실행
            kakao.maps.event.addListener(marker, 'click', function () {
                overlay.setMap(map);
            });



        }


        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);

        //마커위에 뜨는 인포윈도우 실행.
        function makeOverListener(map, marker, infowindow,) {
            return function () {
                infowindow.open(map, marker);
               
            };
        }







        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function () {
                infowindow.close();
            };
        }
        // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
        function closeOverlay(closeNum) {
            //overlay.setMap(null);     
            /*for (let i = 0; i < markers.length; i++) {
              markers[i].setMap(null);
            }*/
            
            overlays[closeNum].setMap(null);
        }

		
      //weatherapi 시작
        function loadWeather() {
            $.getJSON('http://api.openweathermap.org/data/2.5/forecast?id=1840982&appid=30d4fa643a685e88d6090a518393094e&units=metric', function (data) {
                //data로 할일.
                //alert(data.city.name);
                //alert(data.list[0].main.temp_min);
                //alert(data.list[0].wind.speed);
                let $cTemp = data.list[0].main.temp;
                let $minTemp = data.list[0].main.temp_min;
                let $maxTemp = data.list[0].main.temp_max;
                let $seaLevel = data.list[0].main.sea_level;
                let $windSpeed = data.list[0].wind.speed;
                let $Humidity = data.list[0].main.humidity;
                //let $now = new Date($.now());
                let $cDate = data.list[0].dt_txt;
                //let $cDate = $now.getFullYear()+'.'+($now.getMonth()+1)+'.'+$now.getDate();
                let $wIcon = data.list[0].weather[0].icon;
                //현재시간 출력방법
                //Date.now(); == $.now
                //new Date(Date.now());
                //alert(new Date($.now()));
                //get month 월은 0이 1월임





                //A.appendTo(B) B요소 내용의 뒤에 B를 추가
                //A.append(B) A요소 내용의 뒤에 B를 추가
                //A.prependTo(B) B요소 내용의 뒤에 B를 추가
                //A.prepend(B) A요소 내용의 뒤에 B를 추가

                $('#ctemp').append($cTemp);
                $('#clowtemp').append($minTemp);
                $('#chightemp').append($maxTemp);
                $('#sealevel').append($seaLevel);
                $('#windspeed').append($windSpeed);
                //$('h2').prepend($cDate);
                $('#humidity').append($Humidity);
                $('.cicon').append('<img src="http://openweathermap.org/img/wn/' + $wIcon + '@2x.png"/>');

                //<img src="http://openweathermap.org/img/wn/10d@2x.png">


            });
        }
        //스와이퍼


        var swiper = new Swiper(".mySwiper", {
            direction: "vertical",
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            autoplay: {
                delay: 4000,
                disableOnInteraction: false // 쓸어 넘기거나 버튼 클릭 시 자동 슬라이드 정지.
            },

        });

        //스와이퍼 끝
        
        

    </script>
</body>

</html>