
$( window ).load(function(){


emojione.imageType = 'png';
emojione.sprites = true;
console.log(gon.day_emotions_keys);
  var data = {
    labels: gon.day_states_keys,
    datasets: [
        {
            data: gon.day_states_values,
            backgroundColor: [
                "#FF6384",
                "#36A2EB",
                "#FFCE56",
                "#16a085",
                "#ecf0f1",
                "#d35400"
            ],
            hoverBackgroundColor: [
                "#FF6384",
                "#36A2EB",
                "#FFCE56",
                "#16a085",
                "#ecf0f1",
                "#d35400"
            ]
        }]

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
