//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require turbolinks
//= require_tree .

function initMap() {

    var map = new google.maps.Map(document.getElementById('map'), {
        center: {
            lat: 40.739,
            lng: -73.990
        },
        zoom: 13
    });
    var input = (document.getElementById('pac-input'));

    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo('bounds', map);

    var infowindow = new google.maps.InfoWindow();

    var locations = gon.places
    console.log(locations)
        // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow()
    var marker, i;
    for (i = 0; i < locations.length; i++) {

        var position = {
            lat: locations[i].latitude,
            lng: locations[i].longitude
        };

        marker = new google.maps.Marker({
            map: map,
            position: position,
            title: locations[i].name
        });

        // Allow each marker to have an info window
        var infoWindowContent;
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                // infoWindow.setContent(infoWindowContent);
                infoWindowContent = locations[i].name
                infoWindow.setContent(infoWindowContent)
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Automatically center the map fitting all markers on the screen
        // map.fitBounds(bounds);
    }

    autocomplete.addListener('place_changed', function() {
        infowindow.close();
        // marker.setVisible(true);
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
        }
        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17); // Why 17? Because it looks good.
        }

        var address = '';
        if (place.address_components) {
            address = [
                (place.address_components[0] && place.address_components[0].short_name || ''),
                (place.address_components[1] && place.address_components[1].short_name || ''),
                (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }


        document.getElementById('place_name').value = place.name;
        // document.getElementById('current').innerHTML = '<p>' + address + '</p>';
        document.getElementById('place_address').value = address;
        var lat = '';
        lat = place.geometry.location.lat();
        // document.getElementById('lat').innerHTML = '<p>' + lat + '</p>';
        document.getElementById('place_latitude').value = lat;
        var long = '';
        long = place.geometry.location.lng();
        // document.getElementById('long').innerHTML = '<p>' + long + '</p>';
        document.getElementById('place_longitude').value = long;
        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map, marker);

    });

    $("form input").last().addClass('btn-floating btn-large waves-effect waves-light red').css({
        fontSize: 20
    });

}
