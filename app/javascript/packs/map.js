function initMap() {
    let div = document.getElementById("map");
    let location = {
        lat: div.getAttribute("data-center-lat"),
        lng: div.getAttribute("data-center-lng")
    }

    const map = new google.maps.Map(div, {
        zoom: 10,
        center: location
    });

    let breweries = document.querySelectorAll("li.brewery-result-item");
    breweries = Array.from(breweries);
    let coords = breweries.map(brewery => {
        return {
            lat: brewery.getAttribute("data-latitude"),
            lng: brewery.getAttribute("data-longitude")
        }
    });

    coords.forEach(position => {
        const marker = new google.maps.Marker({
            position: position,
            map: map
        });
    });
    console.log(coords);
}

window.initMap = initMap;