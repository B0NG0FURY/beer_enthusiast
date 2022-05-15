function initMap() {
    let div = document.getElementById("map");
    let location = div.getAttribute("data-location");
    let results = document.querySelector("results-list");
    let coords = results.map(element => {
        return {
            lat: element.getAttribute("data-lat"),
            lng: element.getAttribute("data-lng")
        }
    });
}

document.addEventListener("DOMContentLoaded", function() {
    initMap();
});