/**
 * 
 */
function initializeMap() {
  var mapDiv = document.getElementById('map');
  var address = document.getElementById('accomlocation').value;
  var geocoder = new google.maps.Geocoder();

  geocoder.geocode({ address: address }, function(results, status) {
    if (status === 'OK') {
      if (results.length > 0) {
        var latitude = results[0].geometry.location.lat();
        var longitude = results[0].geometry.location.lng();

        var map = new google.maps.Map(mapDiv, {
          center: { lat: latitude, lng: longitude },
          zoom: 16
        });

        var marker = new google.maps.Marker({
          position: { lat: latitude, lng: longitude },
          map: map,
          title: '위치'
        });
      }
    } else {
      alert('주소를 찾을 수 없습니다.');
    }
  });
}


window.onload = function() {
  initializeMap();
};