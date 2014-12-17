var CUSTOM_MAP_ID = 'custom_style';

// Custom Styling 
var featureOpts = [
  {
    stylers: [
      { hue: '#890000' },
      { visibility: 'simplified' },
      { gamma: 0.5 },
      { weight: 0.5 }
    ]
  },
  {
    elementType: 'labels',
    stylers: [
      { visibility: 'off' }
    ]
  },
  {
    featureType: 'water',
    stylers: [
      { color: '#890000' }
    ]
  }
];

function initialize() {
  var mapOptions = {
    center: { lat: 33.748995, lng: -84.387982 },
    zoom: 10,
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, CUSTOM_MAP_ID]
    },
    // TODO: this breaks it.
    // MapTypeId: CUSTOM_MAP_ID; 
    // scrollwheel: false
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  var styledMapOptions = {
   name: 'custom_style' 
  };

  var trafficLayer = new google.maps.TrafficLayer();
  trafficLayer.setMap(map);

  // Try HTML5 geolocation
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'Location found using HTML5.'
      });

      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }
}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

google.maps.event.addDomListener(window, 'load', initialize);
