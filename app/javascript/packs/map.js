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
    let breweryInfo = breweries.map(brewery => {
        return {
            coords: {
                lat: parseFloat(brewery.getAttribute("data-latitude")),
                lng: parseFloat(brewery.getAttribute("data-longitude"))
            },
            title: brewery.children[0].innerText
        }
    });

    breweryInfo.forEach((brewery, i) => {
        const marker = new google.maps.Marker({
            position: brewery.coords,
            map: map,
            label: (i + 1).toString(),
            title: brewery.title
        });
    });
    console.log(breweryInfo);
}

window.initMap = initMap;