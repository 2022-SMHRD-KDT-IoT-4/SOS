let battery = ['battery-full-outline', 'battery-half-outline', 'battery-dead-outline'];
let color = ['color:green', 'color:orange', 'color:red']
let status = ['정상', '불안', '불량']
let trid = []
let waterList = "";
function loadJacketList(user_id){
   $.ajax({
      url : 'getjacketinfo.do',
      type : 'get',
      data : {"user_id" : user_id},
      dataType : 'json',
      success : MakeJacketList, 
      error : function(){alert('error')}
   });
}
function loadWaterList(seq){
   let result = "";
   $.ajax({
      url : 'getdate.do',
      type : 'get',
      data : {"jacket_seq" : seq},
      dataType : 'json',
      async: false,
      success : function(data){
      result = data;
      }, 
      error : function(){alert('error')}
   });
   return result;
}
                        
function MakeJacketList(data){
   $('#istbody').html("");
   let value = 0;
   for(let i = 0; i<data.length; i++){
      jacketList = data[i];
      waterList = loadWaterList(jacketList.jacket_seq);
      let randBattery = Math.floor(Math.random() * battery.length);
      tr = `<tr id= 'reData"+i+"' onclick="chartView1()">
           <td id="jacketSeq" style="display: none; visibility: collapse;">${jacketList.jacket_seq}</td>
              <td>${jacketList.product_id}</td>
              <td><span><ion-icon name=${battery[randBattery]} style=${color[randBattery]} width="50px"></ion-icon></span>`;
              if(color[randBattery]=='color:green'){
                 value = Math.floor(Math.random() * (100-80))+80;
              }
              else if(color[randBattery] == 'color:orange'){
                 value = Math.floor(Math.random() * (80-40))+40;
              }
              else if(color[randBattery] == 'color:red'){
                 value = Math.floor(Math.random() * 40)
              }
        tr += `${value}%</td>
              <td>온도:${waterList.water_temperature} 수압:${waterList.water_pressure} 물감지:${waterList.water_detect}</td>
              <td><span class="status disconnect">${status[randBattery]}</span></td>
              </tr>
      `;
      $('#istbody').append(tr);

      
      }
      
}

function LoadNoticeList(){
	$.ajax({
      url : 'getnoticelist.do',
      type : 'get',
      dataType : 'json',
      success : MakeNoticeList, 
      error : function(){alert('error')}
   });
}


function MakeNoticeList(data){
	console.log(data);
	$('#noticetbody').html("");
	for(let i=0; i<data.length; i++){
		noticelist = data[i];
		tr = `
				<tr>
                    <td width="60px">${noticelist.notice_date}</td>
                    <td><h4>관리자<br><span>${noticelist.notice_content}</span></h4></td>
                    </tr>
		`;
		$('#noticetbody').append(tr);
	}
}

function LoadJacketInfo(){
	$.ajax({
      url : 'getjacketuseuser.do',
      type : 'get',
      dataType : 'json',
      success : MakeJacketInfo, 
      error : function(){alert('error')}
   });
}

function MakeJacketInfo(data){
	console.log(data)
	$('#istthead').html("");
	let t1 = `
				<tr>
					<td>고객명</td>
                    <td>사용 구명조끼 수</td>
                </tr>`;
    $('#istthead').append(t1);
	for(let i=0; i<data.length; i++){
		jacketinfo = data[i];
		tr = `
		 		<tr>
		 			<td onclick='LoadJacketInfoDetail("${jacketinfo.user_id}")'>${jacketinfo.user_id}</td>
		 			<td>${jacketinfo.jacket_seq}</td>
		 		<tr>	
		`;
		$('#isttbody').append(tr);
	}
}

function LoadJacketInfoDetail(user_id){
	$.ajax({
      url : 'getjacketinfodetail.do',
      type : 'get',
      data : {'user_id' : user_id},
      dataType : 'json',
      success : MakeJacketInfoDetail, 
      error : function(){alert('error')}
   });
}

function MakeJacketInfoDetail(data){
	console.log(data)
	$('#istthead').html("");
	let t1 = `
				<tr>
                	<td>고객명</td>
                	<td>등록일자</td>
                	<td>제품번호</td>
                	<td>통신상태</td>
                </tr>`;
    $('#istthead').append(t1);
    $('#isttbody').html("");
	for(let i=0; i<data.length; i++){
		let randBattery = Math.floor(Math.random() * battery.length);
		let bat = status[randBattery];
		jacketinfo = data[i];
		tr = `
		 		 <tr>
                     <td>${jacketinfo.user_id}</td>
                     <td>${jacketinfo.jacket_date}</td>
                     <td>${jacketinfo.product_id}</td>
                     
		`;
		if(bat =="정상"){
			tr += `<td><span class="status connect">${status[randBattery]}</span></td>
                 </tr>`;
		}else {
			tr += `<td><span class="status disconnect">${status[randBattery]}</span></td>
                 </tr>	`;
		}
		$('#isttbody').append(tr);
	}
}


     