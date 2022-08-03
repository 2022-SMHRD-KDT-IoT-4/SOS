var ctx = document.getElementById('myChart').getContext('2d');

document.getElementById('reDataA').onclick = function(){
      
    //데이터셋 수 만큼 반복
    var dataset = myChart.data.datasets;
    for(var i=0; i<dataset.length; i++){
        console.log(dataset);
        //데이터 갯수 만큼 반복
        var data = dataset[i].data;
        for(var j=0 ; j < data.length ; j++){
            data[j] = Math.floor(Math.random() * 50);
        }
    }
    
    myChart.update();   //차트 업데이트
}
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        /*라벨은 시간 넣어야함*/
        labels: ['1', '2', '3','4','5','6','7'],
        datasets: [
            {
            label: '온도',
            data: [Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50)],
            
            backgroundColor: 'rgba(255, 99, 132, 1)'
            },
            {
            label: '수압',
            data: [Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50),
                Math.floor(Math.random() * 50)],
            
            backgroundColor: 'rgba(255, 206, 86, 1)'
            },
            {
                label: '물감지',
                data: [Math.floor(Math.random() * 50),
               Math.floor(Math.random() * 50),
               Math.floor(Math.random() * 50),
               Math.floor(Math.random() * 50),
               Math.floor(Math.random() * 50),
               Math.floor(Math.random() * 50),
               Math.floor(Math.random() * 50)],
                
                backgroundColor: 'rgba(54, 162, 235, 1)'
                }
        ]
    },
    options: {
       responsive: true,
    }
});





 /*var temperature = document.getElementById('temperature').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'polarArea',
    data: {
        labels: ['A', 'B', 'C'],
        datasets: [{
            label: 'usingTime',
            data: [180,120,80],
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)'
                
            ],
            
            
        }]
    },
    options: {
        responsive: true,
    }
});


var temperature = new Chart(temperature, {
    type: 'line',
    data: {
        labels: ['1', '2', '3','4','5','6','7','8','9','12','13',],
        datasets: [
            {
            label: '온도',
            data: [24, 21, 23],
            
            backgroundColor: 'rgba(255, 99, 132, 1)'
            },
            {
            label: '수압',
            data: [40, 50, 100],
            
            backgroundColor: 'rgba(255, 206, 86, 1)'
            },
            {
                label: '물감지',
                data: [0, 500, 700],
                
                backgroundColor: 'rgba(54, 162, 235, 1)'
                }
        ]
    },
    options: {
       responsive: true,
    }
});*/