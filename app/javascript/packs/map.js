function initMap() {
    let div = document.getElementById("map");
    let location = {
        lat: div.getAttribute("data-center-lat"),
        lng: div.getAttribute("data-center-lng")
    }
    let breweries = document.querySelectorAll("li.brewery-result-item");
    breweries = Array.from(breweries);
    let coords = breweries.map(brewery => {
        return {
            lat: brewery.getAttribute("data-latitude"),
            lng: brewery.getAttribute("data-longitude")
        }
    });
    console.log(coords);
}

window.initMap = initMap;