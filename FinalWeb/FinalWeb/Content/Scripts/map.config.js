function initialize() {
    var mapOptions = {
        zoom: 14,
        center: new google.maps.LatLng(16.771533, 96.168551),
        disableDefaultUI: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: false,
        disableDoubleClickZoom: false
    }
    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


    var image = '../Content/Images/map-pin.png';
    var myLatLng = new google.maps.LatLng(16.771533, 96.168551);
    var beachMarker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image
    });
}
google.maps.event.addDomListener(window, 'load', initialize);
