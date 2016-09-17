$(document).ready(function() {

  return $.ajax({
    dataType: 'text',
    url: 'reports/tweets.json',
    success: function(data) {
      var geojson = $.parseJSON(data);
      console.log(geojson)
      return map.featureLayer.setGeoJSON(geojson);
    }
  });
});
