
$( window ).load(function(){

  
emojione.imageType = 'png';
emojione.sprites = true;
  var data = {
    labels: gon.day_emotions_keys,
    datasets: [
        {
            data: gon.day_emotions_values,
            backgroundColor: [
                "#FF6384",
                "#36A2EB",
                "#FFCE56",
                "#2ecc71",
            ],
            hoverBackgroundColor: [
                "#FF6384",
                "#36A2EB",
                "#FFCE56",
                "#2ecc71",
            ]
        }]

  };
 var proj_data = {
     labels: [
      "June",
      "July",
      "August",
      "September",
      "Projected"
  ],
  datasets: [
      {
          data: [100, 150, 250, 400,700],
          backgroundColor: [
              "#FF6384",
              "#36A2EB",
              "#FFCE56",
              "#2ecc71",
              "#9b59b6",
          ],
          hoverBackgroundColor: [
              "#FF6384",
              "#36A2EB",
              "#FFCE56",
              "#2ecc71",
              "#9b59b6",
          ]
      }]
 }

var individual_data = {
    labels: ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00"],
    datasets: [
        {
            label: "Packages/hour",
            fill: false,
            lineTension: 0.1,
            backgroundColor: "rgba(75,192,192,0.4)",
            borderColor: "rgba(75,192,192,1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(75,192,192,1)",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(75,192,192,1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            data: [20,25,20,10,15,30,30,35,40],
            spanGaps: false,
        }
    ]
};
try{
var myPieChart = new Chart($(".isc").get(0).getContext("2d"),{
    type: 'pie',
    data: data,
    options: {
        legend: {
            display: true,
        }
    }
  });
  var myBarChart = new Chart($(".projsales").get(0).getContext("2d"),{
    type: 'bar',
    data: proj_data,
    options: {
        legend: {
            display: false,
        }
    }
  });
}
catch (e){
  console.log("Home page" + e)
}

});

function getKeyValues(hash){
  var array_keys = new Array();
  var array_values = new Array();
  for (var entry in hash){
    array_keys.push(entry);
    array_values.push(hash[entry]);
  }

  return array_keys, array_values
}
