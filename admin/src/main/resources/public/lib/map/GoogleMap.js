var GoogleMap = function(id , latitude , longitude , zoom) {
    this.map = initMap(id , latitude , longitude);
    this.geocoder = new google.maps.Geocoder();
    this.marker = initMarker(this.map , latitude , longitude);

    function initMap(id , latitude , longitude) {

        var map = new google.maps.Map(document.getElementById(id) , {
            zoom: zoom,
            center: {lat: latitude, lng: longitude}
        });

        return map;
    }

    function initMarker(map , latitude , longitude) {

        var marker = new google.maps.Marker({
            map: map,
            draggable: true,
            animation: google.maps.Animation.DROP,
            position: new google.maps.LatLng(latitude, longitude)
        });

        return marker;
    }
};

GoogleMap.prototype.addEventListenerMapClick = function (fnSuccess) {
    var that = this;
    google.maps.event.addListener(this.map, 'click', function (mapPosition) {
        that.marker.setPosition(mapPosition.latLng);

        if (fnSuccess)
            fnSuccess(mapPosition.latLng);
    });
};

GoogleMap.prototype.addEventListenerMarkerDrag = function (fnSuccess) {
    google.maps.event.addListener(this.marker, 'dragend', function (markerPosition) {
        if (fnSuccess)
            fnSuccess(markerPosition.latLng);
    });
};

GoogleMap.prototype.geocodeAddress = function(address , fnSuccess , fnFail) {
    var that = this;
    this.geocoder.geocode({'address': address}, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
            var geoLocation = results[0].geometry.location;

            that.map.setCenter(geoLocation);

            that.marker.setPosition(geoLocation);

            fnSuccess(geoLocation);
        } else {
            fnFail(status);
        }
    });
};

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