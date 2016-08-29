function high_column( series_name, element_id, data_url) {


  $.ajax({
    url: data_url,
    dataType: 'json',
    success: function(result){

      $(element_id).highcharts({
        chart: {
            type: 'column'
        },
        title: { 
            text: 'Compare ( ' + series_name + ' )'
        },
        subtitle: {
            text: 'Current status'
        },
        xAxis: {
            categories: [],
            crosshair: true
        },
        yAxis: {
          min: 0,
          title: {
              text: 'Score Percentage ( % )'
          },
          labels: {
            format: '{value} %',
            style: {
                //color: Highcharts.getOptions().colors[2]
            }
          }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px"><b>{point.key}</b></span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0">&nbsp;<b> {point.y:.1f} %</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: series_name,
            data: []
        }],
        credits: {
            enabled: false // for remove highcharts link
        }
      });

      var chart = $(element_id).highcharts();
      var categories = [];
      var point = [];

      if (chart) {

        $.each(result.collection, function(key, va) {
        categories.push(key);
        point.push(parseFloat(va) / 2.0 * 100);
        });

        chart.xAxis[0].setCategories(categories);
        chart.series[0].setData(point);

      }

    }

  });

}