$(document).ready(function() {

  $.ajax({
    dataType: 'text',
    url: 'reports/tweets.json',
    success: function(data) {
      var geojson = $.parseJSON(data);
      // console.log(geojson)
      return map.featureLayer.setGeoJSON(geojson);
    }
  });


  centerMap();
  popups();
$(".segment_map").on('click', ".report", graphGenerate);
$(".segment_map").on('click', ".report", function() {
    $('html, body').animate({
        scrollTop: $(".graph-container").offset().top
    }, 500);
});





});

// "img.leaflet-marker-icon .leaflet-zoom-animated .leaflet-clickable"

var centerMap = function () {
  map.featureLayer.on('click', function(e) {
        map.panTo(e.layer.getLatLng());
    });
}


var popups = function () {
  map.featureLayer.on('layeradd', function(e) {
    // console.log("event");
    var marker, popupContent, properties;
    marker = e.layer;
    properties = marker.feature.properties;
    popupContent = (
    								'<div class="popup">' +
    									'<div class="metweet"></div>' +
                       '<h3>' + properties.name + '</h3>' +
                       '<p>' + properties.handle + '</p>' + 
                       '<h2>' + properties.content + '</h2>' + 
                       '<p>Datetime:  ' + properties.date_tweeted + '</p>' +
                       '<center><button class="report">View Analysis</button></center>' +
                    '</div>');
    // graphGenerate();
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 320 }
      // graphGenerate()
    );
    // return graphGenerate();
  });
  // return marker.graphGenerate();
}

// popups.done(function(result) { 
//   console.log(result);
//   $(result).on("click", graphGenerate);
// });

// class="leaflet-marker-icon leaflet-zoom-animated leaflet-clickable" tabindex="0" style="margin-left: -15px; margin-top: -35px; width: 30px; height: 70px; transform: translate3d(-247px, -563px, 0px); z-index: -563;">




var graphGenerate = function () { 
    console.log("hit");
      var ctx = document.getElementById("myChart");
      var doughnutOptions = {
        responsive: true,
        maintainAspectRatio: false,
        title: {
            text: 'Language Style',
            display: true,
        },
        legend: {
              display: false,
            }
      };

      var doughnutOptions2 = {
        responsive: true,
        maintainAspectRatio: false,
        title: {
            text: 'Emotion',
            display: true,
        },
        legend: {
              display: false,
            }
      };

       var doughnutOptions3 = {
        responsive: true,
        maintainAspectRatio: false,
        title: {
            text: 'Social Tendencies',
            display: true,
        },
        legend: {
              display: false,
            }
      };
      var data = {
          labels: [
              "Tentative",
              "Confident",
              "Analytical"
          ],
          datasets: [
              {
                  data: [300, 50, 100],
                  backgroundColor: [
                      "#EC2660",
                      "#4296F6",
                      "#D3D3D3"
                  ],
                  hoverBackgroundColor: [
                      "#EC2660",
                      "#4296F6",
                      "#D3D3D3"
                  ]
              }]
      };
      var myDoughnutChart = new Chart(ctx, {
          type: 'doughnut',
          data: data,
          options: doughnutOptions
      });

      var ctx = document.getElementById("myChart2");
      var data = {
          labels: [
              "Fear",
              "Sadness",
              "Anger"
          ],
          datasets: [
              {
                  data: [100, 200, 50],
                  backgroundColor: [
                      "#EC2660",
                      "#4296F6",
                      "#D3D3D3"
                  ],
                  hoverBackgroundColor: [
                      "#EC2660",
                      "#4296F6",
                      "#D3D3D3"
                  ]
              }]
      };
      var myDoughnutChart = new Chart(ctx, {
          type: 'doughnut',
          data: data,
          options: doughnutOptions2
      });

      var ctx = document.getElementById("myChart3");
      var data = {
          labels: [
              "Agreeableness",
              "Emotional",
              "Extraversion"
          ],
          datasets: [
              {
                  data: [50, 300, 100],
                  backgroundColor: [
                      "#EC2660",
                      "#4296F6",
                      "#D3D3D3"
                  ],
                  hoverBackgroundColor: [
                      "#EC2660",
                      "#4296F6",
                      "#D3D3D3"

                  ]
              }]
      };
      var myDoughnutChart = new Chart(ctx, {
          type: 'doughnut',
          data: data,
          options: doughnutOptions3
  });
};

// function scrollToAnchor(spot){
//     var divTag = $("div[class='" + spot +"']");
//     $('html,body').animate({scrollTop: divTag.offset().top},'slow');
// }





