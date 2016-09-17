# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $.ajax
    dataType: 'text'
    url: 'reports/tweets.json'
    success: (data) ->
      geojson = $.parseJSON(data)
      map.featureLayer.setGeoJSON(geojson)
