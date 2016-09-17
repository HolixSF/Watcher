$(document).ready(function() {
  return $.ajax({
    dataType: 'text',
    url: 'reports/tweets.json',
    success: function(data) {
      var geojson;
      geojson = $.parseJSON(data);
      return map.featureLayer.setGeoJSON(geojson);
    }
  });
});