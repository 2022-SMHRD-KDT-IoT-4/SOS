let battery = ['battery-full-outline', 'battery-half-outline', 'battery-dead-outline'];
let color = ['color:green', 'color:orange', 'color:red']
let status = ['정상', '불안', '불량']
let trid = []
let waterList = "";
function loadJacketList(){
   $.ajax({
      url : 'getjacketinfo.do',
      type : 'get',
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



     