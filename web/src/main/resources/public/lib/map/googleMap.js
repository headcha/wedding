function initMap(id, latitude, longitude, zoom) {

    var map = new google.maps.Map(document.getElementById(id), {
        zoom: zoom,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: {lat: latitude, lng: longitude},
        draggable: false,
        scrollwheel: false
    });

    google.maps.event.addDomListener(window, "resize", function () {
        map.setCenter(this.latlng);
    });

    var marker = new google.maps.Marker({
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        position: new google.maps.LatLng(latitude, longitude)
    });
}

