
function initializeIndexCharts(){
    try{
      console.log($(".isc").get(0).getContext("2d"));
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
