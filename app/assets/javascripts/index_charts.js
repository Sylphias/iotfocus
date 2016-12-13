
$( window ).load(function() {

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
  initializeIndexCharts();
});
function initializeIndexCharts(){
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
  console.log(gon.day_states_keys)
  console.log(gon.day_states_values)
    try{
      var myPieChart = new Chart($(".isc").get(0).getContext("2d"),{
        type: 'pie',
        data: data,
        options: {
            legend: {
                display: true,
            },
        }
      });
  }
  catch (e){
    console.log("indiv page" + e)

  }
}
