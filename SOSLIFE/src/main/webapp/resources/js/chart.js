 Highcharts.stockChart('container', {
        chart: {
          events: {
            load: function () {
      
              // set up the updating of the chart each second
              var series = this.series[0];
              var series1 = this.series[1];
              var series2 = this.series[2];
              console.log(this.series)
              setInterval(function () {
                var x = (new Date()).getTime(), // current time
                  y = Math.round(Math.random() * 100);
                series.addPoint([x,y], true, false);
                
                
                var y1 = Math.round(Math.random() * 100);
                series1.addPoint([x,y1], false, false);
                
                
                var y2 = Math.round(Math.random() * 100);
                -series2.addPoint([x,y2], false, false);
              }, 1000);
            }
          }
        },
      
        accessibility: {
          enabled: false
          
        },
      
        time: {
          useUTC: false    
        },
      
        rangeSelector: {
          buttons: [{
            count: 1,
            type: 'minute',
            text: '1M'
          }, {
            count: 5,
            type: 'minute',
            text: '5M'
          }, {
            type: 'all',
            text: 'All'
          }],
          inputEnabled: false,
          selected: 0
        },
      
        title: {
          text: '온도,수위,수압'        },
        colors:['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)'],

        exporting: {
          enabled: false
        },
      
        series: [{
          
          name: '온도',
          data: (function () {
            // generate an array of random data
            var data = [],
              time = (new Date()).getTime(),
              i;
      
            for (i = -999; i <= 0; i += 1) {
              data.push([
                time + i * 1000,
                Math.round(Math.random() * 100)
                
              ]);
              
            }
           
            return data;
          }())
        },{
          
            name: '수압',
            data: (function () {
                // generate an array of random data
                var data = [],
                time = (new Date()).getTime(),
                i;
        
                for (i = -999; i <= 0; i += 1) {
                data.push([
                    time + i * 1000,
                    Math.round(Math.random() * 100)
                    
                ]);
              
            }
           
            return data;
          }())
        },{
          
          name: '수위',
          data: (function () {
            // generate an array of random data
            var data = [],
              time = (new Date()).getTime(),
              i;
      
            for (i = -999; i <= 0; i += 1) {
              data.push([
                time + i * 1000,
                Math.round(Math.random() * 100)
                
              ]);
              
            }
           
            return data;
          }())
        }]
      });