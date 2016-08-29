function high_gauge_collection(data_title_position, data_title_em_size, key_title_position, key_title_em_size, chart_height, pane_size, v_position, element_id, data_url, data_key, waiting_time) {

  $.ajax({
    url: data_url,
    dataType: 'json',
    success: function(result){
    if (result['collection'][data_key] != null) { // if chapter not selected in json
      
      var newVal = parseFloat(result['collection'][data_key]) / 2.0 * 100;

      var gaugeOptions = {  // main options set
        chart: {
          type: 'solidgauge',
          height: chart_height,
          margin: [0, 1, 0, 1]
        },

        title: null,

        pane: {
            center: ['50%', v_position],
            size: pane_size,
            startAngle: -90,
            endAngle: 90,
            background: {
                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                innerRadius: '60%',
                outerRadius: '100%',
                shape: 'arc'
            }
        },

        tooltip: {
            enabled: false
        },

        // the value axis
        yAxis: {
          min: 0,
          max: 100,
          stops: [
            [0.499, 'Crimson'], // red
            [0.849, 'GOLD'], // yellow
            [1, 'SEAGREEN'] // green
          ],
         lineWidth: 2,
          minorTickInterval: null,
          minTickInterval: 10,
          tickPosition: "inside",
          tickWidth: 2,
          tickColor: '#C0D0E0',
          title: {
            text: data_key, // data title
            style: {
              color: '#337ab7',
              fontSize: key_title_em_size
            },
            y: key_title_position
          },
          labels: {
            style: {
              color: '#333',
              fontSize: '1.2em'
            },
            y: 13 // ticks 10, 20 ... was 16
          }
        },

        plotOptions: {
          solidgauge: {
            dataLabels: {
              y: data_title_position, // data number %
              borderWidth: 1,
              useHTML: true,
              formatter: function () {
                return '<span style="font-size:' + data_title_em_size +'em; text-shadow: 1px 2px #EEE; color:' + this.point.color + ';">' + Highcharts.numberFormat(this.point.y,1) + ' %</span>';
              }
            }
          }
        }
      };

      $(element_id).highcharts(Highcharts.merge(gaugeOptions, {
        credits: {
            enabled: false
        },

        series: [{
          name: data_key, // show in tooltip if it is ture
          data: [newVal],
          tooltip: {
            valueSuffix: ' %'
          }
        }]
      }));

      $(element_id).highcharts().series[0].points[0].update({ // this because bug not update point with color and get first color in default color array
        color: $(element_id).highcharts().series[0].points[0].color
      });

    }}
  });

  // new value
  setInterval(function () {
    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){
        // Speed
        var chart = $(element_id).highcharts(),
            point,
            newVal;

        if (chart) {
            point = chart.series[0].points[0];
            newVal = parseFloat(result['collection'][data_key]) / 2.0 * 100;
            point.update(newVal);
        }

        $(element_id).highcharts().series[0].points[0].update({
          color: $(element_id).highcharts().series[0].points[0].color
        });

      }
    });
  }, waiting_time);

}