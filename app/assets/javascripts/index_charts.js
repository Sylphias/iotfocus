
function initializeIndexCharts(){
  try{

    console.log($(".isc").get(0).getContext("2d"));
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
    console.log("Home page error: " + e)
  }

}
// try{  
//   var myLineChart = new Chart($(".indiv-chart").get(0).getContext("2d"), {
//     type: 'line',
//     data: individual_data,
//   });
// }
// catch (e){
//   console.log("indiv page" + e)

// }
