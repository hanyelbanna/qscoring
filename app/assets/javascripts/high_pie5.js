function high_pie5(element_id, data_url, data_key1, data_key2, data_key3, data_key4, data_key5, waiting_time) {

  $.ajax({
    url: data_url,
    dataType: 'json',
    success: function(result){

      $(element_id).highcharts({
        chart: {
          height: 200,
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          type: 'pie'
        },
        //colors: ['#d9534f', '#f0ad4e', '#26a69a'],
        colors: ['#c6c6c6', '#5bc0de', '#d9534f', '#f0ad4e', '#26a69a'],
        title: null,
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    distance: 5,
                    format: '{point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        credits: {
            enabled: false // for remove highcharts link
        },
        series: [{
            name: "Status",
            colorByPoint: true,
            data: [
              {name: "Not Scored", y: result[data_key1]},
              {name: "Not Validated", y: result[data_key2]},
              {name: "Refused", y: result[data_key3]},
              {name: "Rescored", y: result[data_key4]},
              {name: "Approved", y: result[data_key5]}
            ]
        }]
      });
    }
  });

  // new value
  setInterval(function () {
    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){
        var chart = $(element_id).highcharts();

        if (chart) {
            chart.series[0].setData([
              {name: "Not Scored", y: result[data_key1]},
              {name: "Not Validated", y: result[data_key2]},
              {name: "Refused", y: result[data_key3]},
              {name: "Rescored", y: result[data_key4]},
              {name: "Approved", y: result[data_key5]}
            ]);
        }
      }
    });
  }, waiting_time);

}