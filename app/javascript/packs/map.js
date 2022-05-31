function initMap() {
    let div = document.getElementById("map");
    let location = {
        lat: parseFloat(div.getAttribute("data-center-lat")),
        lng: parseFloat(div.getAttribute("data-center-lng"))
    }

    const map = new google.maps.Map(div, {
        zoom: 12,
        center: location
    });

    let breweries = document.querySelectorAll("li.brewery-result-item");
    breweries = Array.from(breweries);
    let coords = breweries.map(brewery => {
        return {
            lat: parseFloat(brewery.getAttribute("data-latitude")),
            lng: parseFloat(brewery.getAttribute("data-longitude"))
        }
    });

    coords.forEach((position, i) => {
        const marker = new google.maps.Marker({
            position: position,
            map: map,
            label: (i + 1).toString()
        });
    });
    console.log(coords);
}

window.initMap = initMap;