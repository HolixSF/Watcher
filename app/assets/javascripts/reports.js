$(document).ready(function() {

  $.ajax({
    dataType: 'text',
    url: 'reports/tweets.json',
    success: function(data) {
      var geojson = $.parseJSON(data);
      console.log(geojson)
      return map.featureLayer.setGeoJSON(geojson);
    }
  });


  centerMap();
  popups();
});


var centerMap = function () {
  map.featureLayer.on('click', function(e) {
        map.panTo(e.layer.getLatLng());
    });
}
var popups = function () {
  map.featureLayer.on('layeradd', function(e) {
    var marker, popupContent, properties;
    marker = e.layer;
    properties = marker.feature.properties;
    popupContent = '<div class="popup">' + '<h3>' + properties.name + '</h3>' + '<p>' + properties.handle + '</p>' + '<h2>' + properties.content + '</h2>' + '</div>';
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 320
    });
  });
}
