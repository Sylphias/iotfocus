
function initializeIndexCharts(){
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
